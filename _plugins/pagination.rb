module Jekyll
  class WithinCategoryPostNavigation < Generator
    def generate(site)
      site.config['cats'].each_pair do |name, attr|
        posts = Array.new

        # search for posts in this category
        site.pages.each do |page|
          if page["category"] == name
            posts.push(page)
          end
        end

        posts.sort! { |a,b| b.name <=> a.name}
        posts.each do |post|
          index = posts.index post
          next_in_category = nil
          previous_in_category = nil
          if index
            if index < posts.length - 1
              next_in_category = posts[index + 1]
            end
            if index > 0
              previous_in_category = posts[index - 1]
            end
          end
          post.data["next_in_category"] = next_in_category unless next_in_category.nil?
          post.data["previous_in_category"] = previous_in_category unless previous_in_category.nil?
        end
      end
    end
  end
end
