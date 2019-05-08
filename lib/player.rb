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
end
