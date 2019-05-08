require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  # ActiveRecord::Base.logger.level = Logger.new(STDOUT)
  # ActiveRecord::Base.logger.level = nil

  p = Player.first
  p.sign_up(age_level: 14, position: "MB")
  c = Coach.first
  
  
  binding.pry

  c.new_eval(tryout_number: p.tryout_number, setting: 8)
end
