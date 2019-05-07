class CreateTryouts < ActiveRecord::Migration[5.0]
  def change
    create_table :tryouts do |t|
      t.integer :player_id
      t.integer :coach_id
      t.string :season
      t.integer :age_level
      t.integer :tryout_number
      t.integer :player_height
      t.string :player_position
      t.integer :passing
      t.integer :setting
      t.integer :hitting
      t.integer :emotions
      t.integer :talking
      t.integer :learning
    end
  end
end
