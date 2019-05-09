class Interface

  def self.greet
    system "clear"
    puts "Welcome to Very Badly Designed Volleyball Systems LLC..."
  end

  def self.firstQuestion
    input = $prompt.select("Are you 'Player' or 'Coach'?", %w(Player Coach Exit))
    if input == "Player"
      name_p
    elsif input == "Coach"
      name_c
    elsif input == "Exit"
      puts "Good Bye"
    end
  end

  def self.name_p
    input = $prompt.ask("Please enter your name: ")
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
      input = $prompt.ask("Hello coach, please enter your name: ").downcase
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
        Interface.e_continue
      else
        puts "Nothing done, back to the menu..."
        Interface.e_continue
      end
  end
  
  def self.coach_menu_6(coach)
    p1name = $prompt.ask("Enter 1st player name: ")
    if Player.find_by(name: p1name) == nil 
      puts "Invalid Player Name" 
      Interface.e_continue
      return
    end
    p2name = $prompt.ask("Enter 2nd player name: ")
    if Player.find_by(name: p2name) == nil 
      puts "Invalid Player Name" 
      Interface.e_continue
      return
    end
    Player.compare_players(first_player: p1name, second_player: p2name)
    Interface.e_continue
  end

  def self.coach_menu_5
    Player.signed_players.each do |p|
      puts "##{p.tryout_number} #{p.name} for Level: #{p.age_level} Position: #{p.position} School: #{p.school}"
    end
    Interface.e_continue
  end

  def self.coach_menu_4(coach)
    coach.reload
    if coach.tryouts == []
      puts "You have not evaluated any players..." 
      Interface.e_continue
    else 
        coach.tryouts.each do |t|
        score = t.passing + t.setting + t.hitting + t.emotions + t.talking + t.learning
        puts "For playername: #{t.player.name}, tryout number: #{t.tryout_number}, age level: #{t.age_level}, you rated Passing: #{t.passing} Setting: #{t.setting} Hitting: #{t.hitting} Emotions: #{t.emotions} Talking: #{t.talking} Learning: #{t.learning} Total score of: #{score}"
        Interface.e_continue
      end
    end
  end

  def self.coach_menu_3(coach)
    if coach.players == []
      puts "You have no evaluations..."
      Interface.e_continue
    else
      i = $prompt.select("Delete last evaluation?", %w(No Yes))
      coach.reload
        if i == "Yes"
          coach.delete_last_eval
          puts "Deleting last evaluaton..."
          sleep 1
          puts "Done!"
          Interface.e_continue
        else
          puts "Nothing done..."
          Interface.e_continue
        end
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
    Interface.e_continue
  end

  def self.coach_menu_1(coach)
    tryout_number = $prompt.ask("Enter Tryout Number: ").to_i
    if Player.signed?(tryout_number)
      result = $prompt.collect do
        key(:setting).ask("Setting skills? (1-10): ", convert: :int) 
        key(:passing).ask("Passing skills? (1-10): ", convert: :int)
        key(:hitting).ask("Hitting skills? (1-10): ", convert: :int)
        key(:emotions).ask("Player emotions? (1-10): ", convert: :int)
        key(:talking).ask("Player talking? (1-10): ", convert: :int)
        key(:learning).ask("Player learning? (1-10) ", convert: :int)
      end
      result[:tryout_number] = tryout_number
      system "clear"
      puts "Creating evaluation..."
      coach.make_eval(result)
      sleep 1
      puts "Evaluation sucessful..."
      Interface.e_continue
    else
      puts "That tryout number does not exist..."
      Interface.e_continue
    end
  end

  def self.e_continue
    $prompt.ask("\nPress ENTER to continue...")
  end
end
