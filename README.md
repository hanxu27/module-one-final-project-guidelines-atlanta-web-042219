# snobby_coaches
# Tracks players, coaches, and tryout evaluation

 TO DO
  1. create tables for players, coaches, tryouts
    * players have :name (string), :birthday (date), :phone (string), :school (string)
    * coaches have :name (string), :phone (string), :email(string), :team (string)
    * tryouts have *player, *coach, :season (string), :age_level (integer), :number(integer) :player_height (integer), :player_position (string), :passing, :setting, :hitting, :emotions, :talking, :learning
  2. create classes for player, coach, tryout
    * tryouts belongs_to :player, :coach, :tryout
    * :player has_many :tryout, has_many :coaches, through: :tryouts
    * :coach has_many :tryout, has_many :player, through: :tryouts
  3. dummy data
  4. test database relations
  5. CLI
  6. test persistence
  7. more look up methods compare methods
  8. test methods
  9. build CLI for using methods




    

