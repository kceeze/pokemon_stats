# frozen_string_literal: true

class AddPokemonStats < ActiveRecord::Migration[7.0]
  def up 
    all_pokemon = Pokemon.all.map{|p| p.id}.each_with_index
    all_pokemon_stats = []
    all_pokemon.each do | pokemon_id |
      stats = PokemonApi.new(nil, nil).pokemon(pokemon_id).dig("stats")
      all_pokemon_stats << Stat.new(hp: stats[0].dig("base_stat"), 
                                attack: stats[1].dig("base_stat"),
                                defense: stats[2].dig("base_stat"),
                                special_attack: stats[3].dig("base_stat"),
                                special_defense: stats[4].dig("base_stat"),
                                speed: stats[5].dig("base_stat"),
                                pokemon_id: pokemon_id  )
      if pokemon_id % 100 == 0  
        sleep(0.1)
       end
    end
  
    
    all_pokemon_stats.each do | pokemon_stats |
        pokemon_stats.save
        sleep(0.01) 
    end

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
