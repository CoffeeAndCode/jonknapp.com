module Jekyll
  class PageTitleTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      current_page = context.environments.first['page']
      author = current_page['author'] || context.registers[:site].config['defaults']['author']
      if current_page['id']
        "#{current_page['title']} by #{author}"
      else
        "#{current_page['title']} &bull; jonknapp.com" || "#{author}"
      end
    end
  end
end

Liquid::Template.register_tag('page_title', Jekyll::PageTitleTag)
