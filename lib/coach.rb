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

    def find_eval(tryout_number:)
        self.reload
        begin
            self.tryouts.find do |t|
                t.coach_id == self.id &&
                t.player_id == Player.find_by(tryout_number: tryout_number).id
            end
        rescue => exception
            return nil
        else
            self.tryouts.find do |t|
                t.coach_id == self.id &&
                t.player_id == Player.find_by(tryout_number: tryout_number).id
            end
        end
    end

    def make_eval(tryout_number:, setting:, passing:, hitting:, emotions:, talking:, learning:)
        eval = self.find_eval(tryout_number: tryout_number)

        if eval
            eval.setting = setting
            eval.passing = passing
            eval.hitting = hitting
            eval.emotions = emotions
            eval.talking = talking
            eval.learning = learning
            eval.save
        else
            eval = new_eval(tryout_number: tryout_number, setting: setting, passing: passing, hitting: hitting, emotions: emotions, talking: talking, learning: learning)
        end
        eval
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
