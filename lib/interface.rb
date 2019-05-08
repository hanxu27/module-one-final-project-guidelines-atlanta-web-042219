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
      new_player(input)
    end
  end

  def name_c
    puts "What is your name?"
    input = gets.chomp.downcase
    if Coache.all.select {|coach| coach.name.downcase == input }.present?
      arr = Coach.all.select {|coach| coach.name.downcase == input }
      puts "Nice to meet you, #{input}."
        #Display for current information, ask function..
    end
  end

  def new_player(name)
    puts "Welcome to Hello Volleyball, #{name}!"

    puts "Please type your date of birth. ex)2006,02,01"
    bday = gets.chomp.downcase

    puts "Please type your phone number. ex)404-222-3333"
    phone_num = gets.chomp.downcase

    puts "Please type your school name. ex)Flatiron School"
    school = gets.chomp.downcase

    Player.create(name: name, birthday: bday, phone: phone_num, school: school)
  end

  def new_sign_up(player)
    puts "1.Sign Up"
    puts "2.Edit information"
    puts "3.Go Back"
    input = gets.chomp.downcase
    if input == "1"
      puts "Type in age level:"
      age_level = gets.chomp
      puts "Type in positon:"
      position = gets.chomp
      binding.pry
      player.sign_up(age_level: age_level, position: position)

    elsif input == "2"
      player.change_info

    elsif input == "3"
      firstQuestion
    else
      puts "Invalid input."
    end
  end



  def run
    greet
    firstQuestion
  end
end
