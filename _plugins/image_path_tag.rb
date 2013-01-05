module Jekyll
  class ImagePathTag < Liquid::Tag
    @alt = nil
    @url = nil

    IMAGE_URL = /((https?:\/\/|\/)?(\S+))/i
    IMAGE_URL_WITH_ALT = /((https?:\/\/|\/)?(\S+))(\s+)"(.*?)"/i

    def initialize(tag_name, markup, tokens)
      super
      if markup =~ IMAGE_URL_WITH_ALT
        @alt = $5
        @url = $1
      elsif markup =~ IMAGE_URL
        @url = $1
      end
    end

    def render(context)
      current_page = context.environments.first['page']
      post = context.registers[:site].posts.find { |x| x.url == current_page['url'] }
      "<img alt=\"#{@alt}\" src=\"/images/#{current_page['date'].year}/#{post.slug}/#{@url}\" />"
    end
  end
end

Liquid::Template.register_tag('image_path', Jekyll::ImagePathTag)