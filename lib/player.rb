class Player < ActiveRecord::Base
    has_many :tryouts
    has_many :coaches, through: :tryouts

    def sign_up(age_level:, position:)
    # sign up for tryout by giving player
    # age_level, position, tryout_number
        self.age_level = age_level
        self.position = position
        self.tryout_number = self.id
        self.save
    end

    def self.new_player(name)
      system "clear"
      puts "Welcome to Player Registration, #{name}!"

      bday = $prompt.ask("Please type your date of birth (yyyy/mm/dd) ") do |q|
        # val = q.validate(/\d{4}\D\d{2}\D\d{2}/, "Invalid Input...")
        q.validate(/^(19|20)\d\d[- (\/|\-).](0[1-9]|1[012])[- (\/|\-).](0[1-9]|[12][0-9]|3[01])$/, "Invalid date...")
      end



      phone_num = $prompt.ask("Please type your phone number (404-222-3333) ") do |q|
        q.validate(/\d{3}\D\d{3}\D\d{4}/, "Invalid Input...")
      end

      school = $prompt.ask("Please type your school name (Flatiron School)") do |q|
        q.validate(/.{3,}/, "Invalid Input...")

      end

      player = Player.create(name: name, birthday: bday, phone: phone_num, school: school)
      binding.pry
      Interface.player_menu(player)
    end

    def change_info
      system "clear"
      input = $prompt.select("What do you want to change?") do |m|
      m.choice "1. Name", 1
      m.choice "2. Birthday", 2
      m.choice "3. School's name", 3
      m.choice "4. Phone number", 4
      m.choice "5. Go Back", 5
      end
      case input
      when 1
        print "Enter new name: "
        self.name = gets.chomp
        changing
      when 2
        print "Enter new birthday (format: yyyy-mm-dd): "
        self.birthday = Date.parse(gets)
        changing
      when 3
        print "Enter new school's name: "
        self.school = gets.chomp
        changing
      when 4
        print "Enter new phone number (format: 404-222-3333): "
        self.phone = gets.chomp
        changing
      when 5
        return
      end
    end

    def view_eval
    # view the average score of eval, out of 60
        self.reload
        score = 0.0
        self.tryouts.each do |e|
            score = score + e.passing.to_i + e.setting.to_i + e.hitting.to_i + e.emotions.to_i + e.talking.to_i + e.learning.to_i
        end
        score / self.tryouts.count
    end

    def self.signed_players
      Player.all.select { |p| p.tryout_number != nil }
    end

    def self.signed?(check_number)
      arr = self.signed_players.map { |p| p.tryout_number }
      arr.include?(check_number)
    end

    def changing
      self.save
      puts "Updating..."
      sleep 1
      puts "Done."
      Interface.e_continue
      change_info
    end

    def self.compare_players(first_player:, second_player:)
      # compare the scores of first player against second player by name
      p1 = Player.find_by(name: first_player)
      p2 = Player.find_by(name: second_player)
      
      begin
          p1.view_eval
          p2.view_eval
      rescue => exception
          return nil
      else
          puts "#{first_player} scored: #{p1.view_eval}"
          puts "#{second_player} scored: #{p2.view_eval}"
          p1.view_eval - p2.view_eval
      end
    end
end
