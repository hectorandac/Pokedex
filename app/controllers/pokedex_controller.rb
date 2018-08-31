class PokedexController < ApplicationController
  def show
    @pokemons = Pokemon.all
  end
end
