module FilterPokemon
    def filter(filter_table)
        filter_name = "#{filter_table.to_s.underscore}_filters"
        session[filter_name] = {} unless session.key?(filter_name)
        session[filter_name].merge!(filter_params_for(filter_table))
        filter_table.filter(session[filter_name])     
    end

    def filter_params_for(filter_table) 
        params.permit(filter_table::FILTER_PARAMS)
    end
    
    private
end