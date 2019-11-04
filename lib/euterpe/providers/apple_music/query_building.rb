# frozen_string_literal: true

module Euterpe
  module Providers
    module AppleMusic
      module QueryBuilding
        module_function

        def fetch_query(source_link:)
          track_parameters = URI.decode_www_form(URI.parse(source_link).query)
          track_id = Hash[track_parameters]['i']
          track = ITunesSearchAPI.lookup(id: track_id)
          "#{track['artistName']} |#{track['trackName']}"
        end
      end
    end
  end
end
