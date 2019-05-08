require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  # ActiveRecord::Base.logger.level = Logger.new(STDOUT)
  # ActiveRecord::Base.logger.level = nil

  p = Player.first
  p.sign_up(age_level: 14, position: "MB")
  c = Coach.first
  c2 = Coach.last
  pl = Player.last
  pl.sign_up(age_level: 17, position: "S")

  
  
  binding.pry
  c.new_eval(tryout_number: pl.tryout_number, setting: 6, passing: 3, hitting: 5, emotions: 7, talking: 6, learning: 9)
  c2.new_eval(tryout_number: pl.tryout_number, setting: 8, passing: 5, hitting: 6, emotions: 5, talking: 7, learning: 8)
end
