Player.destroy_all
Coach.destroy_all
Tryout.destroy_all

5.times do |i|
    Coach.create(name: "Some Coach #{i}", phone: "111-222-3333", email: "coach#{i}@vb.com", team: "100-#{i}")
end

10.times do |i|
    player = Player.create(name: "Certain Player #{i}", birthday: Date.new(2005,01,31), phone: "123-456-7890", school: "Certain High School")
    player.sign_up(age_level: 17, position: "OH")
    c_id = Coach.all.first.id
    Tryout.create(player_id: player.id, coach_id: c_id, passing: 7, setting: 8, hitting: 7, emotions: 8, talking: 7, learning: 8)
end

9.times do |i|
    Player.create(name: "A Player ##{i}", birthday: Date.new(2006,02,01), phone: "098-765-4321", school: "A school")
end

11.times do |i|
    player1 = Player.create(name: "Best Player #{i}", birthday: Date.new(2007,10,1), phone: "456-123-7890", school: "Best School")
    player1.sign_up(age_level: 14, position: "DS")
end


