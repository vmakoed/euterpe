# frozen_string_literal: true

module Euterpe
  module Providers
    module Spotify
      module LinkGeneration
        module_function

        def fetch_link(query:)
          Euterpe::Authentication.authenticate(service: SERVICE)
          result = RSpotify::Track.search(query)
          result.first.external_urls['spotify']
        end
      end
    end
  end
end
