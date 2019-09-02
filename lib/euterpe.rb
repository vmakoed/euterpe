# frozen_string_literal: true

require 'active_support/all'

require 'euterpe/version'
require 'euterpe/aggregator'

module Euterpe
  PROVIDERS = [
    { domain: 'open.spotify.com', name: 'spotify', fetch_info: true },
    { domain: 'music.apple.com', name: 'apple_music' }
  ].freeze
end
