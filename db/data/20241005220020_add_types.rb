# frozen_string_literal: true

class AddTypes < ActiveRecord::Migration[7.0]
  def up
    total_types = 19 
    for i in (1..total_types)  
      type = PokemonApi.new.type(i)
      Type.create(name: type.dig("name"))
      sleep(0.01)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
