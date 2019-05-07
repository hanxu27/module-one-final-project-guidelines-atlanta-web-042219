require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  # ActiveRecord::Base.logger.level = Logger.new(STDOUT)
  ActiveRecord::Base.logger.level = nil
  Pry.start
end
