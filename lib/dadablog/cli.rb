require 'thor'
require 'dadablog/generators/create'

module Dadablog
  class CLI < Thor
    desc "create", "Generates a blog scaffold"
    def create(blog_dir, blog_title='dadablog', disqus_shortname='disqus.com')
      Dadablog::Generators::Create.start([blog_dir, blog_title, disqus_shortname])
    end
  end
end