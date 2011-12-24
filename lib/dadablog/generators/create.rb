require 'thor/group'

module Dadablog
  module Generators
    class Create < Thor::Group
      include Thor::Actions

      argument :blog_dir, :type => :string
      argument :blog_title, :type => :string
      argument :disqus_shortname, :type => :string

      def self.source_root
        File.dirname(__FILE__) + "/create"
      end

      def create_blog
        empty_directory blog_dir
        empty_directory "#{blog_dir}/articles"
        empty_directory "#{blog_dir}/logs"

      end

      def copy_public
        directory 'public', "#{blog_dir}/public"
      end

      def copy_views
        directory 'views', "#{blog_dir}/views"
        gsub_file "#{blog_dir}/views/layout.erb", /#blog_title#/, blog_title
        gsub_file "#{blog_dir}/views/post.erb", /#disqus_shortname#/, disqus_shortname
      end

      def copy_files
        copy_file 'config.ru', "#{blog_dir}/config.ru"
        copy_file '.gitignore', "#{blog_dir}/.gitignore"
        copy_file 'server.sh', "#{blog_dir}/server.sh"
        copy_file 'Gemfile', "#{blog_dir}/Gemfile"
        template 'hello-world.md', "#{blog_dir}/articles/hello-world.md"
      end

    end
  end
end