module Jekyll

  class SeriesPage < Page
    def initialize(site, base, dir, series)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'series_overview.html')

      #category_title_prefix = site.config['series_title_prefix'] || 'Series: '

      self.data['desc'] = series['desc']
      self.data['child_series'] = series['name']
      self.data['title'] = series['desc']
      unless series.has_key?('numbering')
        series['numbering'] = false
      end
      self.data['numbering'] = series['numbering']
    end
  end

  class SeriesPageGenerator < Generator
    safe true

    def generate(site)
      #if site.layouts.key? 'category_index'
        dir = site.config['series_dir'] || 'series'
        series = site.config["series"]
        # convert hash to array
        sers = Array.new
        series.each do |key,el|
          el['name'] = "#{key}"
          sers.push(el)
        end
        # sort alphabetically after displayed name
        sers = sers.sort { |a,b| a['desc'] <=> b['desc'] }

        # filter
        sers = sers.select { |x|
          x['displayed']
        }

        sers.each do |el|
          site.pages << SeriesPage.new(site, site.source, File.join(dir, el['name']), el)
        end
      #end
    end
  end

end
