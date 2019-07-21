# frozen_string_literal: true

module Euterpe
  module Providers
    module AppleMusic
      module LinkGeneration
        module_function

        def fetch_link(query:)
          results = ITunesSearchAPI.search(term: query)
          results.first['trackViewUrl']
        end
      end
    end
  end
end
