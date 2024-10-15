# frozen_string_literal: true

class AddPokemon < ActiveRecord::Migration[7.0]
  def up
    pokemon_count = 1025
    pokemon_id = 1
    batch_pokemon = []
    while pokemon_id <= pokemon_count   
       pokemon_response = PokemonApi.new(nil, nil).pokemon(pokemon_id)
       batch_pokemon << Pokemon.new(name: pokemon_response.dig("name"), height: pokemon_response.dig("height"), weight: pokemon_response.dig("weight"))
       if batch_pokemon.count % 100 == 0  
        sleep(2)
       end
       pokemon_id += 1
    end

    batch_pokemon.each_with_index do |p, index| 
        p.save
        puts "\n===========POKEMON #{index + 1 }=====================\n"
        puts "NAME: #{p.name}"
        puts "SAVED!"
        puts "\n======================================\n"
        sleep(0.01) # throttle
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
