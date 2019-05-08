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
      puts "Welcome to Hello Volleyball, #{name}!"

      puts "Please type your date of birth. format) yyyy/mm/dd"
      bday = DateTime.strptime(gets.chomp, '%Y/%m/%d')

      puts "Please type your phone number. ex)404-222-3333"
      phone_num = gets.chomp.downcase

      puts "Please type your school name. ex)Flatiron School"
      school = gets.chomp.downcase

      Player.create(name: name, birthday: bday, phone: phone_num, school: school)
    end

    def change_info
      puts "What do you want to change? (choose number)"
      puts "1. Name"
      puts "2. Birthday"
      puts "3. School's name"
      puts "4. Phone number"
      puts "5. Go Back"
      input = gets.chomp
      case input
      when "1"
        print "Enter new name: "
        self.name = gets.chomp
      when "2"
        print "Enter new birthday (format: yyyy/mm/dd)\n"
        self.birthday = DateTime.strptime(gets.chomp, '%Y/%m/%d')
      when "3"
        print "Enter new school's name: "
        self.school = gets.chomp
      when "4"
        print "Enter new phone number: "
        self.phone = gets.chomp
      when "5"
        print "Go Back\n"
        a = Interface.new
         a.name_p
      else
        puts "Invalid input."
      end
      self.save
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

    def view_coaches
    # view unique coaches that have evaluated this player
      self.coaches.uniq.map { |c| c.name }
    end

    def self.signed_players
      Player.all.select { |p| p.tryout_number != nil }
    end
end
