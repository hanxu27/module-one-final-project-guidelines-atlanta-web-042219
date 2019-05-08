class Coach < ActiveRecord::Base
    has_many :tryouts
    has_many :players, through: :tryouts

    def new_eval(tryout_number:, setting:, passing:, hitting:, emotions:, talking:, learning:)
        player = Player.find(tryout_number)
        tryout = Tryout.create(player_id: player.id, coach_id: self.id, setting: setting, passing: passing, hitting: hitting, emotions: emotions, talking: talking, learning: learning)
        tryout.age_level = player.age_level
        tryout.player_position = player.position
        tryout.tryout_number = tryout_number
        tryout.save
    end

    def clear_players
        #clear players who have not signed up
        Player.where(tryout_number: nil).destroy_all
    end

    def my_eval
        # return array of player names this coach
        # has evaluated
        self.players.uniq.map { |p| p.name }
    end

end
