require 'jekyll_asset_pipeline'

module JekyllAssetPipeline
  class CssCompressor < JekyllAssetPipeline::Compressor
    require 'yui/compressor'

    def self.filetype
      '.css'
    end

    def compress
      return YUI::CssCompressor.new.compress(@content)
    end
  end

  class CssTagTemplate < JekyllAssetPipeline::Template
    def self.filetype
      '.css'
    end

    def html
      "<link href=\"/#{@path}/#{@filename}\" rel=\"stylesheet\" type=\"text/css\" />"
    end
  end

  class JavaScriptCompressor < JekyllAssetPipeline::Compressor
    require 'closure-compiler'

    def self.filetype
      '.js'
    end

    def compress
      return Closure::Compiler.new.compile(@content)
    end
  end

  class JavaScriptTagTemplate < JekyllAssetPipeline::Template
    def self.filetype
      '.js'
    end

    def html
      "<script src=\"/#{@path}/#{@filename}\" type=\"text/javascript\"></script>"
    end
  end

  class LessConverter < JekyllAssetPipeline::Converter
    require 'less'

    def self.filetype
      '.less'
    end

    def convert
      parser = Less::Parser.new :paths => ['_assets/css/'], :filename => 'style.less'
      return parser.parse(@content).to_css
    end
  end
end
