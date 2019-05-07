class AddSignUpColumns < ActiveRecord::Migration[5.0]
  def change
    add_column(:players, :age_level, :integer)
    add_column(:players, :tryout_number, :integer)
    add_column(:players, :position, :string)
  end
end
