# frozen_string_literal: true

module Euterpe
  module Providers
    module Spotify
      module QueryBuilding
        module_function

        def fetch_query(source_link:)
          track_id = URI.parse(source_link).path.split('/').last
          track = RSpotify::Track.find(track_id)
          "#{track.artists.map(&:name).join(' ')} #{track.name}"
        end
      end
    end
  end
end
