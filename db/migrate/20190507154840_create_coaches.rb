class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :team
    end
  end
end
