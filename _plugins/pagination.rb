module Jekyll
  class WithinSeriesPostNavigation < Generator
    def generate(site)
      site.config['series'].each_pair do |name, attr|
        posts = Array.new

        # search for posts in this category
        site.pages.each do |page|
          if page["series"] == name
            posts.push(page)
          end
        end

        posts.sort! { |a,b| b.name <=> a.name}
        posts.each do |post|
          index = posts.index post
          next_in_series = nil
          previous_in_series = nil
          if index
            if index < posts.length - 1
              next_in_series = posts[index + 1]
            end
            if index > 0
              previous_in_series = posts[index - 1]
            end
          end
          post.data["next_in_series"] = next_in_series unless next_in_series.nil?
          post.data["previous_in_series"] = previous_in_series unless previous_in_series.nil?
        end
      end
    end
  end
end
