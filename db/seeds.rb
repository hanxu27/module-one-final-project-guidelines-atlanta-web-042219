Player.destroy_all
Coach.destroy_all
Tryout.destroy_all

10.times do |i|
    Player.create(name: "Certain Player #{i}", birthday: Date.new(2005,01,31), phone: "123-456-7890", school: "Certain High School")
end

9.times do |i|
    Player.create(name: "A Player ##{i}", birthday: Date.new(2006,02,01), phone: "098-765-4321", school: "A school")
end

11.times do |i|
    Player.create(name: "Best Player #{i}", birthday: Date.new(2007,10,1), phone: "456-123-7890", school: "Best School")
end

5.times do |i|    
    Coach.create(name: "Some Coach #{i}", phone: "111-222-3333", email: "coach#{i}@vb.com", team: "100-#{i}")
end
