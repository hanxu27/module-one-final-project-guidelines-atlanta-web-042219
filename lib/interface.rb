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
        coach
      elsif input == "exit"
        puts "Good Bye"
      end
  end

  def name_p
    puts "What is your name?"
      input = gets.chomp.downcase
      if Player.all.select {|player| player.name.downcase == input }.present?
        arr = Player.all.select {|player| player.name.downcase == input }
        puts "Nice to meet you, #{input}."
        #Display for current information
      else
        puts "Welcome to Hello Volleyball, #{input}."
        birthday

  def name_c
    puts "What is your name?"
      input == gets.chomp.downcase
      if Coache.all.select {|coach| coach.name.downcase == input }.present?
        arr = Coach.all.select {|coach| coach.name.downcase == input }
        puts "Nice to meet you, #{input}."
        #Display for current information, ask function.
      end
    end
  end
end
      end
    end
  end

  def birthday
    puts "Please type your date of birth. ex)2006,02,01"
      input == gets.chomp.downcase
      phone
    end
  end

  def phone
    puts "Please type your phone number. ex)404-222-3333"
      input == gets.chomp.downcase
      school'ed
  end


  def school
    puts "Please type your school name. ex)Flatiron School"
  end


  def run
    greet
    firstQuestion
  end
