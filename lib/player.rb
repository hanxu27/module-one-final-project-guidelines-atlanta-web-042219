class Player < ActiveRecord::Base
    has_many :tryouts
    has_many :coaches, through: :tryouts
end
