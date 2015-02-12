module Jekyll

  class SeriesCatGenerator < Generator
    safe true
    priority :low

    def generate(site)

      series = site.config["series"]
      
      # search for series
      series.each do |key,el|
        el['pages'] = Array.new
        site.pages.each do |page|

          if page.data["series"] == el["name"]
            url = page.url
            title = page.data["title"]
            obj = {"url" => url, "title" => title}
            el['pages'].push(obj)
          end
        end
      end
      
    end
  end
end
