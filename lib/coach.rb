class Coach < ActiveRecord::Base
    has_many :tryouts
    has_many :players, through: :tryouts
end
