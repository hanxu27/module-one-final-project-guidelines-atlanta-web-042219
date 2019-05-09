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
    input = $prompt.ask("What is your name? ")
    if Player.all.select {|player| player.name.downcase == input }.present?
      arr = Player.all.select {|player| player.name.downcase == input }
      player = arr[0]
        #Display for current information
      return self.new_sign_up(player)
    else
      Player.new_player(input)
    end
  end

  def self.name_c
    input = ""
    while input
      puts "Hello coach, please enter your name:"
      input = gets.chomp.downcase
      if Coach.all.select {|coach| coach.name.downcase == input }.present?
        coach = Coach.all.find {|coach| coach.name.downcase == input }
        self.coach_menu(coach)
      elsif input == "exit"
        puts "Signing Off"
        exit
      else
        puts "Sorry that's not a valid coach."
      end
    end
  end

  def self.new_sign_up(player)
    # player = Player.all.find {|x| x == player }
    system "clear"
    puts "Welcome Back, #{player.name}!"
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

  def self.coach_menu(coach)
    input = ""
    while input
      system "clear"
      message = "Welcome coach #{coach.name}\n Menu:\n" 
      options = [
        {value: 1, name: "Make an evaluation"},
        {value: 2, name: "Check who I have evaluated"},
        {value: 3, name: "Delete my last evaluation"},
        {value: 4, name: "Review my evaluations"},
        # \n here
        {value: 5, name: "View all players for tryout"},
        # \n here
        {value: 6, name: "Compare player scores"},
        {value: 7, name: "Clear all players who have not signed up"},
        # \n here
        {value: 9, name: "Exit"}]
        
       input = $prompt.select(message, options)

      case input
      when 9
        puts "Signing off..."
        exit
      when 7
        system "clear"
        coach_menu_7(coach)
      when 6
        system "clear"
        coach_menu_6(coach)
      when 5
        system "clear"
        coach_menu_5
      when 4
        system "clear"
        coach_menu_4(coach)
      when 3
        system "clear"
        coach_menu_3(coach)
      when 2
        system "clear"
        coach_menu_2(coach)
      when 1
        system "clear"
        coach_menu_1(coach)
      end
    end
  end

  def self.coach_menu_7(coach)
    puts "Are you sure? This cannot be undone... (Y/n)"
      i = gets.strip
      if i == "Y"
        coach.clear_players
        puts "Deleting all players that have not signed up..."
        sleep 1
        puts "And we are back"
      else
        puts "Nothing done, back to the menu..."
      end
  end
  
  def self.coach_menu_6(coach)
    puts "Enter 1st player name:"
    p1name = gets.downcase.strip
    puts "Enter 2nd player name:"
    p2name = gets.downcase.strip
    coach.compare_players ? (compare_players(first_player: p1name, second_player: p2name)) : (puts "Players not found...")
  end

  def self.coach_menu_5
    Player.signed_players.each do |p|
      puts "##{p.tryout_number} #{p.name} for Level: #{p.age_level} Position: #{p.position} School: #{p.school}"
    end
  end

  def self.coach_menu_4(coach)
    coach.reload
    if coach.tryouts == []
      puts "You have not evaluated any players..." 
    else 
        coach.tryouts.each do |t|
        score = t.passing + t.setting + t.hitting + t.emotions + t.talking + t.learning
        puts "For playername: #{t.player.name}, tryout number: #{t.tryout_number}, age level: #{t.age_level}, you rated Passing: #{t.passing} Setting: #{t.setting} Hitting: #{t.hitting} Emotions: #{t.emotions} Talking: #{t.talking} Learning: #{t.learning} Total score of: #{score}"
      end
    end
  end

  def self.coach_menu_3(coach)
    puts "Delete last evaluation? (Y/n)"
    i = gets.strip
    if i == "Y"
      coach.delete_last_eval
      puts "Deleting last evaluaton..."
      sleep 1
      puts "And we are back"
    else
      puts "Nothing done, back to the menu..."
    end
  end

  def self.coach_menu_2(coach)
    system 'clear'
    name = coach.players
    if name == [] 
      puts "You have not evaluated any players..." 
    else 
      name.each { |p| puts "You have evaluated: #{p.name} with tryout number: ##{p.tryout_number}" }
    end
    $prompt.ask("\nPress ENTER to continue...")
  end

  def self.coach_menu_1(coach)
    puts "Tryout number?:"
    tryout_number = gets.strip.to_i
    if Player.signed?(tryout_number)
      puts "Setting skills? (1-10):"
      setting = gets.strip.to_i
      puts "Passing skills? (1-10):"
      passing = gets.strip.to_i
      puts "Hitting skills? (1-10):"
      hitting = gets.strip.to_i
      puts "Player emotions? (1-10):"
      emotions = gets.strip.to_i
      puts "Player talking? (1-10)"
      talking = gets.strip.to_i
      puts "Player learning? (1-10)"
      learning = gets.strip.to_i

      system "clear"
      puts "Creating evaluation..."
      coach.make_eval(tryout_number: tryout_number, setting: setting, passing: passing, hitting: hitting, emotions: emotions, talking: talking, learning: learning)
      sleep 1
      puts "Evaluation sucessful..."
    else
      puts "That tryout number does not exist..."
    end
  end
end
