# Use the class methods to get down to business quickly
#response = HTTParty.get('https://pokeapi.co/api/v2/')
#response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

#puts response.body, response.code, response.message, response.headers.inspect

# Or wrap things up in your own class
class PokemonApi
  include HTTParty
  base_uri 'pokeapi.co'

  def initialize()
  end

  def all_pokemon
    self.class.get("/api/v2/pokemon")
  end

  def pokemon(pokemon_id)
    self.class.get("/api/v2/pokemon/#{pokemon_id}")
  end

  def type(type_id)
    self.class.get("/api/v2/type/#{type_id}")
  end
end