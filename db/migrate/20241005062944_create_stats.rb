class CreateStats < ActiveRecord::Migration[7.0]
  def change
    create_table :stats do |t|
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.integer :pokemon_id

      t.timestamps
    end
  end
end
