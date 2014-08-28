module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'



      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'cat_container.html')

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '

      self.data['desc'] = category['desc']
      self.data['cat'] = category['name']
      self.data['title'] = category['desc']
      unless category.has_key?('numbering')
        category['numbering'] = false
      end
      self.data['numbering'] = category['numbering']
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      #if site.layouts.key? 'category_index'
        dir = site.config['category_dir'] || 'categories'
        categories = site.config["cats"]
        # convert hash to array
        cats = Array.new
        categories.each do |key,category|
          category['name'] = key
          cats.push(category)
        end
        # sort alphabetically after displayed name
        cats = cats.sort { |a,b| a['desc'] <=> b['desc'] }
        cats.each do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category['name']), category)
        end
      #end
    end
  end

end
