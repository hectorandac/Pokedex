class Pokemon < ApplicationRecord
  has_many :stats
  has_many :abilities

  def self.register(pokemon)

    pokemon_model = Pokemon.create!(
        name: pokemon["name"],
        sprite: pokemon["sprites"]["front_default"],
        weight: pokemon["weight"]
    )

    pokemon["stats"].each do |stat|
      Stat.create!(
              name: stat["stat"]["name"],
              base_stat: stat["base_stat"],
              pokemon_id: pokemon_model.id
      )
    end

    pokemon["abilities"].each do |ability|
      Ability.create!(
                 name: ability["ability"]["name"],
                 pokemon_id: pokemon_model.id
      )
    end

  end
end
