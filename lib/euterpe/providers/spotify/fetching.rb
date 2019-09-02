# frozen_string_literal: true

module Euterpe
  module Providers
    module Spotify
      module Fetching
        module_function

        def fetch_track(query:, with_info: false)
          track = api_request(query)
          track_data = { url: track.external_urls['spotify'] }
          return track_data unless with_info

          track_data.merge(info: track_info(track))
        end

        def api_request(query)
          Euterpe::Authentication.authenticate(service: SERVICE)
          RSpotify::Track.search(query).first
        end

        def track_info(track)
          {
            artist: track.artists.map(&:name).join(', '),
            name: track.name,
            album: track.album.name,
            url: track.external_urls['spotify'],
            release_date: track.album.release_date,
            image: track.album.images.first
          }
        end
      end
    end
  end
end
