require 'sinatra/base'

module Dadablog
  class GithubHook < Sinatra::Base

    def self.parse_git
      sha1 = `git log -1 --pretty=format:%h`
      set :commit_hash, sha1
    end

    parse_git

    before do
      cache_control :public, :must_revalidate
      etag settings.commit_hash
    end

    post '/update' do

      if Dir.pwd == '/'
        Dir.chdir app.settings.root
      end

      content_type :txt

      ret = `git pull 2>&1`
      unless ret == 'Already up-to-date.'
        app.class.reset!
        app.deploy
        settings.parse_git
      end
      ret
    end

  end
end
