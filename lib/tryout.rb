class Tryout < ActiveRecord::Base
    belongs_to :player
    belongs_to :coach
end