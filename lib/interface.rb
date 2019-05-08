class Interface

  def self.greet
    puts "Hello Volleyball"
  end


  def self.firstQuestion
    puts "Are you 'Player' or 'Coach'?"
    input = gets.chomp.downcase
    if input == "player"
      name_p
    elsif input.downcase == "coach"
      name_c
    elsif input == "exit"
      puts "Good Bye"

    end
  end


  def self.name_p
    puts "What is your name?"
    input = gets.chomp.downcase
    if Player.all.select {|player| player.name.downcase == input }.present?
      arr = Player.all.select {|player| player.name.downcase == input }
      player = arr[0]
      puts "Welcome Back, #{input}!"
        #Display for current information
      return self.new_sign_up(player)
    else
      Player.new_player(input)
    end
  end

  def self.name_c
    puts "What is your name?"
    input = gets.chomp.downcase
    if Coache.all.select {|coach| coach.name.downcase == input }.present?
      arr = Coach.all.select {|coach| coach.name.downcase == input }
      puts "Nice to meet you, #{input}."
        #Display for current information, ask function..
    end
  end

  def self.new_sign_up(player)
    # player = Player.all.find {|x| x == player }
    puts "Your Name is #{player.name}."
    puts "Your Birthday is #{player.birthday}."
    puts "Your School's name is #{player.school}."
    puts "Your Phone Number is #{player.phone}."
    puts "1.Sign Up"
    puts "2.Edit information"
    puts "3.View Evaluation"
    puts "4.View Coaches"
    puts "5.Go Back"
    input = gets.chomp.downcase
    if input == "1"
      puts "Type in age level:"
      age_level = gets.chomp
      puts "Type in positon:"
      position = gets.chomp
      # player.sign_up(age_level: age_level, position: position)

      self.new_sign_up(player)

    elsif input == "2"
      player.change_info

    elsif input == "3"
      eval = player.view_eval
      puts "Your average score is #{eval}."
      go_back(player)
    elsif input == "4"
      coach = player.view_coaches
      coach.each do |c|
        puts "You were evaluated by #{c}"
      end
      go_back(player)
    elsif input == "5"
      firstQuestion

    else
      puts "Invalid input."
    end
  end

  def self.go_back(player)
    puts "Do you want to go back to previous options?(Y/N)"
    input = gets.chomp.downcase
    if input == 'y'
      new_sign_up(player)
    else
      goodbye
    end
  end

  def self.goodbye
    puts "Good Bye"
  end

  def self.run
    greet
    firstQuestion
  end
end
