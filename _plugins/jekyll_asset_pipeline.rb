require 'jekyll_asset_pipeline'

module JekyllAssetPipeline
  class CssTagTemplate < JekyllAssetPipeline::Template
    def self.filetype
      '.css'
    end

    def html
      "<link href=\"/#{@path}/#{@filename}\" rel=\"stylesheet\" type=\"text/css\" />"
    end
  end

  class JavascriptTagTemplate < JekyllAssetPipeline::Template
    def self.filetype
      '.js'
    end

    def html
      "<script src=\"/#{@path}/#{@filename}\" type=\"text/javascript\"></script>"
    end
  end
end
