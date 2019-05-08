class Player < ActiveRecord::Base
    has_many :tryouts
    has_many :coaches, through: :tryouts

    def sign_up(age_level:, position:)
        self.age_level = age_level
        self.position = position
        self.tryout_number = self.id
        self.save
    end

    def change_info
      puts "What do you want to change?(choose number)"
      puts "1. Name"
      puts "2. Birthday"
      puts "3. School's name"
      puts "4. Phone number"
      input = gets.chomp
      case input
      when "1"
        print "Enter new name: "
        self.name = gets.chomp
      when "2"
        print "Enter new birthday: "
        self.birtday = gets.chomp
      when "3"
        print "Enter new school's name: "
        self.school = gets.chomp
      when "4"
        print "Enter new phone number: "
        self.phone = gets.chomp
      else
        puts "Invalid input."
        end
      end
end
