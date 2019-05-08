class Player < ActiveRecord::Base
    has_many :tryouts
    has_many :coaches, through: :tryouts

    def sign_up(age_level:, position:)
        self.age_level = age_level
        self.position = position
        self.tryout_number = self.id
    end
end
