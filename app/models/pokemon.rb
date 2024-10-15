class Pokemon < ApplicationRecord
    has_one :stats, foreign_key: 'pokemon_id', class_name: 'Stat'
    has_many :pokemon_types
    has_many :types, through: :pokemon_types

    FILTER_PARAMS  = ["name", "column", "direction",  "type"].freeze
    
    scope :by_name, ->(search_term) { where("pokemons.name like ?", "%#{search_term}%")}
    scope :by_type, ->(type) {where("types.id = ?", type) if type.present?}

    def sprite_image
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{self.id}.png"
    end

    def official_artwork
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/#{self.id}.png"
    end


    def self.filter(filters)
        pokemon = Pokemon.includes(:stats, :pokemon_types, :types)
        pokemon = pokemon.joins(:types) if filters["type"].present?
        pokemon = pokemon.by_name(filters["name"])
        pokemon = pokemon.by_type(filters["type"]) if filters["type"].present?
        pokemon = pokemon.order("#{filters["column"]} #{filters["direction"]}") if filters["column"].present?
        pokemon
    end

    private


end
