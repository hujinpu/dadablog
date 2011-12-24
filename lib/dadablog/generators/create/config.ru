#\-s thin -p 9292 -D -P rack.pid -E deployment

ROOT = ::File.dirname(__FILE__)

require 'logger'
class ::Logger; alias_method :write, :<<; end
logfile = ::File.join(ROOT, 'logs', 'requests.log')
logger  = ::Logger.new(logfile, 'weekly')
use Rack::CommonLogger, logger

require 'rack/cache'
use Rack::Cache

require 'dadablog'
run Dadablog::Blog.new(ROOT)