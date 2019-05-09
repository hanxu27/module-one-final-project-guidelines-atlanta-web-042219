require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  # ActiveRecord::Base.logger.level = Logger.new(STDOUT)
  # ActiveRecord::Base.logger.level = nil

  binding.pry
  c = Coach.first
  c2 = Coach.last
  pl = Player.last
  pl.sign_up(age_level: 17, position: "S")

  name1 = "Certain Player 0"
  name2 = "Certain Player 1"

  p1 = Player.find_by(name: name1)
  p2 = Player.find_by(name: name2)

  p1.sign_up(age_level: 15, position: "OH")
  p2.sign_up(age_level: 15, position: "OH")
  c.make_eval(tryout_number: p1.tryout_number, setting: 10, passing: 10, hitting: 10, emotions: 10, talking: 10, learning: 10)
  c.make_eval(tryout_number: p2.tryout_number, setting: 6, passing: 3, hitting: 5, emotions: 7, talking: 6, learning: 9)

  c.make_eval(tryout_number: pl.tryout_number, setting: 6, passing: 3, hitting: 5, emotions: 7, talking: 6, learning: 9)
  c2.make_eval(tryout_number: pl.tryout_number, setting: 8, passing: 5, hitting: 6, emotions: 5, talking: 7, learning: 8)
  c2.make_eval(tryout_number: pl.tryout_number, setting: 8, passing: 5, hitting: 6, emotions: 5, talking: 7, learning: 100)

end
