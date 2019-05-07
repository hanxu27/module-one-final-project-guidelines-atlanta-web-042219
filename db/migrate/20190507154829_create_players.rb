class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.datetime :birthday
      t.string :phone
      t.string :school
    end
  end
end
