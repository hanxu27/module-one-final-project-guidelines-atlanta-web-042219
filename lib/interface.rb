class Interface

  def greet
    puts "Hello Volleyball"
  end


  def firstQuestion
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


  def name_p
    puts "What is your name?"
    input = gets.chomp.downcase
    if Player.all.select {|player| player.name.downcase == input }.present?
      arr = Player.all.select {|player| player.name.downcase == input }
      player = arr[0]
      puts "Welcome Back, #{input}!"
        #Display for current information
      return new_sign_up(player)
    else
      Player.new_player(input)
    end
  end

  def name_c
    input = ""
    while input
      puts "Hello coach, please enter your name:"
      input = gets.chomp.downcase
      if Coach.all.select {|coach| coach.name.downcase == input }.present?
        coach = Coach.all.find {|coach| coach.name.downcase == input }
        coach_menu(coach)
      elsif input == "exit"
        puts "Signing Off"
        exit
      else
        puts "Sorry that's not a valid coach."
      end
    end
  end

  def new_sign_up(player)
    #Show the player's info. not memory address.
    puts Player.all.select {|x| x == player }
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
      player.sign_up(age_level: age_level, position: position)

    elsif input == "2"
      player.change_info

    elsif input == "3"
      puts player.view_eval

    elsif input == "4"
      player.view_coaches

    elsif input == "5"
      firstQuestion

    else
      puts "Invalid input."
    end
  end

  def run
    greet
    firstQuestion
  end

  def coach_menu(coach)
    system "clear"
    input = ""
    while input
      puts "
      Welcome coach #{coach.name}
      Menu: 
      1. Make an evaluation
      2. Check who I have evaluated
      3. Delete my last evaluation
      4. Review my evaluations

      5. View all players for tryout

      6. Compare player scores
      7. Clear all players who have not signed up
      
      9. Exit"
      puts "Please enter a command:"
      input = gets.downcase.strip
      case input
      when "9"
        puts "Signing off..."
        exit
      when "7"
        system "clear"
        coach_menu_7(coach)
      when "6"
        system "clear"
        coach_menu_6(coach)
      when "5"
        system "clear"
        coach_menu_5
      when "4"
        system "clear"
        coach_menu_4(coach)
      when "3"
        system "clear"
        coach_menu_3(coach)
      when "2"
        system "clear"
        coach_menu_2(coach)
      when "1"
        system "clear"
        coach_menu_1(coach)
      end
    end
  end

  def coach_menu_7(coach)
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
  
  def coach_menu_6(coach)
    puts "Enter 1st player name:"
    p1name = gets.downcase.strip
    puts "Enter 2nd player name:"
    p2name = gets.downcase.strip
    coach.compare_players ? (compare_players(first_player: p1name, second_player: p2name)) : (puts "Players not found...")
  end

  def coach_menu_5
    Player.signed_players.each do |p|
      puts "##{p.tryout_number} #{p.name} for Level: #{p.age_level} Position: #{p.position} School: #{p.school}"
    end
  end

  def coach_menu_4(coach)
    if coach.tryouts == []
      puts "You have not evaluated any players..." 
    else 
        coach.tryouts.each do |t|
        score = t.passing + t.setting + t.hitting + t.emotions + t.talking + t.learning
        puts "For playername: #{t.player.name}, tryout number: #{t.tryout_number}, age level: #{t.age_level}, you rated passing: #{t.passing} setting: #{t.setting} hitting: #{t.hitting} emotions: #{t.emotions} talking: #{t.talking} learning: #{t.learning} with a total score of: #{score}"
      end
    end
  end

  def coach_menu_3(coach)
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

  def coach_menu_2(coach)
    name = coach.players
    if name == [] 
      puts "You have not evaluated any players..." 
    else 
      name.each { |p| puts "You have evaluated: #{p.name} with tryout number: ##{p.tryout_number}" }
    end
  end

  def coach_menu_1(coach)
    puts "Tryout number?:"
    tryout_number = gets.strip.to_i
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
  end
end
