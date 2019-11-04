module Euterpe
  module Providers
    module Deezer
      module Fetching
        module_function

        def fetch_track(query:, with_info: false)
          track = api_request(query)          
          track_data = { url: track['data'].first['link'] }
          return track_data unless with_info

          track_data.merge(info: track_info(track))
        end

        def api_request(query)
          artist_track = query.split('|')

          artist = artist_track.first
          track = artist_track.last

          result = Faraday.get "https://api.deezer.com/search?q=artist:'#{artist}' track:'#{track}'"

          JSON.parse(result.body)
        end

        def track_info(track)
          {
            artist: track['data'].first['artist']['name'],
            name: track['data'].first['title_short'],
            album: track['data'].first['album']['title'],
            url: track['data'].first['link'],
            image: track['data'].first['album']['cover_big']
          }
        end
      end
    end
  end
end
