class PokedexController < ApplicationController

  # Shows the main view for the user
  def show
    # Pass a list of all the pokemons on the database to the html view
    @pokemons = Pokemon.all
  end
end
