module Euterpe
  module Providers
    module Deezer
      module QueryBuilding
        module_function

        def fetch_query(source_link:)
          track_id = URI.parse(source_link).path.split('/').last
          resp = Faraday.get "https://api.deezer.com/track/#{track_id}"
          track = JSON.parse(resp.body)
          "#{track['artist']['name']} |#{track['title']}"
        end
      end
    end
  end
end
