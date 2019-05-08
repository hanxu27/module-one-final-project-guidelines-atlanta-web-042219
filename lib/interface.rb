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
        puts "Welcome, coach #{input}."
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
      # binding.pry
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
    input = ""
    while input
      puts "Menu: 
      1. Make Evaluation
      2. Check who I have evaluated
      3. Delete my last evaluation
      4. Compare player scores
      5. Clear all players who have not signed up
      
      9. Exit"
      puts "Please enter a command:"
      input = gets.downcase.strip
      case input
      when "9"
        puts "Signing off..."
        exit
      # when "1"

      end
    end
  end
end
