module PokemonHelper
    def sort_link(column:, label:)
        if column == params[:column]
          link_to(label, list_pokemon_index_path(column: column, direction: next_direction))
        else
          link_to(label, list_pokemon_index_path(column: column, direction: 'asc'))
        end
      end
      
      def next_direction
        params[:direction] == 'asc' ? 'desc' : 'asc'
      end

      def sort_indicator
        tag.span(class: "sort sort-#{session['pokemon_filters']['direction']}")
      end

      def pokemon_types(pokemon)
        pokemon_types = ""
        pokemon.types.each do |type|
            pokemon_types += "<div class='type-#{type.name} type-icon'>#{type.name}</div>"
        end
        pokemon_types.html_safe
      end
end