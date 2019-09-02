# frozen_string_literal: true

module Euterpe
  module Providers
    module AppleMusic
      module Fetching
        module_function

        def fetch_track(query:, with_info: false)
          track = api_request(query)
          track_data = { url: track['trackViewUrl'] }
          return track_data unless with_info

          track_data.merge(info: track_info(track))
        end

        def api_request(query)
          ITunesSearchAPI.search(term: query).first
        end

        def track_info(track)
          {
            artist: track['artistName'],
            name: track['trackName'],
            album: track['collectionName'],
            url: track['trackViewUrl'],
            release_date: track['release_date'],
            image: track['artworkUrl100']
          }
        end
      end
    end
  end
end
