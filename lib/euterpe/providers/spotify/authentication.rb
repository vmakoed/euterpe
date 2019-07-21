# frozen_string_literal: true

module Euterpe
  module Providers
    module Spotify
      module Authentication
        module_function

        def authenticate
          client_id = ENV['SPOTIFY_CLIENT_ID']
          client_secret = ENV['SPOTIFY_CLIENT_SECRET']
          RSpotify.authenticate(client_id, client_secret)
        end
      end
    end
  end
end
