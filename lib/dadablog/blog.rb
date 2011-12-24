require 'sinatra/base'
require 'dadablog/github_hook'
require 'ostruct'
require 'time'
require 'yaml'
require 'html_truncator'

module Dadablog
  class Blog < Sinatra::Base

    use Dadablog::GithubHook

    enable :logging

    def initialize(root)
      self.class.set :root, root
      super
      deploy
    end

    helpers do
      def truncator_markdown(text, max=50)
        HTML_Truncator.truncate(markdown(text), max)
      end

      def get_css
        css = '<link rel="stylesheet" media="screen" href="/css/blog.css"/>'
        if request.path_info =~ /^\/articles\//
          css << '<link rel="stylesheet" href="/js/fancyBox/source/jquery.fancybox.css?v=2.0.4" type="text/css" media="screen" />'
        end
        css
      end

      def get_js
        js = '<script src="/js/jquery-1.7.1.min.js"></script>' +
            '<script src="/js/jquery.timeago.js"></script>' +
            '<script src="/js/blog.js"></script>'
        if request.path_info =~ /^\/articles\//
          js << '<script src="/js/fancyBox/source/jquery.fancybox.pack.js?v=2.0.4"></script>'
          js << '<script src="/js/post.js"></script>'
        end
        js
      end
    end

    def deploy

      articles = []

      Dir.glob "#{settings.root}/articles/*md" do |file|
        meta, content = File.read(file, {:encoding => 'utf-8'}).split("\n\n", 2)

        article = OpenStruct.new YAML.load(meta)

        article.date = Time.parse article.date.to_s

        article.content = content

        article.slug = File.basename(file, '.md')

        self.class.get "/articles/#{article.slug}" do
          erb :post, :locals => {:article => article}
        end

        articles << article
      end

      articles.sort_by! { |article| article.date }
      articles.reverse!

      self.class.set :articles, articles

      self.class.get '/' do
        erb :index
      end
    end

  end
end
