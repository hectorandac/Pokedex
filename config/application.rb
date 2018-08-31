require_relative 'boot'

require 'net/http'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pokemon2
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #
    #
    config.after_initialize do

      # Indicates the amount of pokemons to import
      base = 50
      if Pokemon.all.size <= base
        # Asynchronous job for getting the pokemons
        Thread.new {
          # There is a limit of 50 pokemons per initialization.
          (base...(base + 50)).each {|i|
            url = URI.parse("https://pokeapi.co/api/v2/pokemon/#{i}/")
            req = Net::HTTP.new(url.host, url.port)
            req.use_ssl = true
            req.verify_mode = OpenSSL::SSL::VERIFY_NONE
            request = Net::HTTP::Get.new(url.request_uri)
            response = req.request(request)

            pokemon = JSON.parse(response.body)

            #Registers the received pokemon
            Pokemon.register(pokemon)
          }
        }
      end
    end
  end
end
