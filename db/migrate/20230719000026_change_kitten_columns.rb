class ChangeKittenColumns < ActiveRecord::Migration[7.0]
  def up
    change_column :kittens, :cuteness, :string
    change_column :kittens, :softness, :string
  end

  def down
    change_column :kittens, :cuteness, :integer
    change_column :kittens, :softness, :integer
  end
end
