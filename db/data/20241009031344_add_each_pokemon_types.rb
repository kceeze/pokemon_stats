# frozen_string_literal: true

class AddEachPokemonTypes < ActiveRecord::Migration[7.0]
  def up
    Pokemon.all.each do |pokemon|
        types = PokemonApi.new.pokemon(pokemon.id).dig("types")
        types.each do | type|
          pokemon_type = PokemonType.new(pokemon_id: pokemon.id, type_id: type_id(type))
          pokemon_type.save
        end

      if pokemon.id % 100 == 0  
        sleep(2) #Keeps the api from receiving too many requests
       end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

  private

  def type_id(type)
    Type.find_by(name: type["type"]["name"]).id
  end
end
