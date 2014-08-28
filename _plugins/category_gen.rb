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
      self.data['gen_cat'] = true
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      #if site.layouts.key? 'category_index'
        site.pages = site.pages.sort { |a,b|
          1
        }
        dir = site.config['category_dir'] || 'categories'
        categories = site.config["cats"]
        categories = categories.sort { |a,b| a['desc'] <=> b['desc'] }
        categories.each do |category|
          catname = category['name']
          puts category['desc']
          site.pages << CategoryPage.new(site, site.source, File.join(dir, catname), category)
        end
      #end
    end
  end

end
