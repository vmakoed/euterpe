# frozen_string_literal: true

require 'dotenv/load'
require 'active_support/all'

require 'euterpe/version'
require 'euterpe/links_generator'

module Euterpe
  PROVIDERS = [
    { domain: 'open.spotify.com', name: 'spotify' },
    { domain: 'music.apple.com', name: 'apple_music' }
  ].freeze
end
