# frozen_string_literal: true

class AddBaseTotalToStats < ActiveRecord::Migration[7.0]
  def up
    Stat.all.each do | pokemon_stats|
      pokemon_stats.base_total =  pokemon_stats.hp + pokemon_stats.attack + pokemon_stats.defense + pokemon_stats.special_attack + pokemon_stats.special_defense + pokemon_stats.speed 
      pokemon_stats.save
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
