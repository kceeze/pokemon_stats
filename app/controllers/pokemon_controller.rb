class PokemonController < ApplicationController
    include FilterPokemon
    
    def index
        @pagy ,@all_pokemon = pagy(filter(Pokemon), items: 100)
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        respond_to do |format|
            format.html
        end
    end

    def column
        params[:column].present? ? params[:column] : "id"
    end

    def direction
        params[:direction].present? ? params[:direction] : "asc"
    end

    def list
        pagy ,all_pokemon = pagy(filter(Pokemon), items: 100)
        render(partial: 'pokemon_table', locals: { all_pokemon: all_pokemon, pagy: pagy })
    end

end