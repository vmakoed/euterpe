# frozen_string_literal: true

require 'euterpe/providers/resolver'
require 'euterpe/providers/apple_music'
require 'euterpe/providers/spotify'
require 'euterpe/providers/deezer'
require 'euterpe/authentication'

module Euterpe
  class Aggregator
    class << self
      def run(source_link:)
        new(source_link: source_link).run
      end
    end

    def initialize(source_link:)
      @source_link = source_link
      @provider = nil
      @query = nil
    end

    def run
      @provider = Euterpe::Providers::Resolver.resolve(link: @source_link)
      @query = build_query
      wrap_tracks(fetch_tracks)
    end

    private

    def wrap_tracks(tracks)
      track_with_info = tracks.values.find { |track| track[:info].present? }
      return { links: tracks } unless track_with_info.present?

      {
        links: tracks.map { |provider, data| { provider => data[:url] } }.reduce({}, :merge),
        info: track_with_info[:info]
      }
    end

    def build_query
      Euterpe::Authentication.authenticate(service: @provider)
      query_builder = "Euterpe::Providers::#{@provider.classify}::QueryBuilding"
      Object.const_get(query_builder).fetch_query(source_link: @source_link)
    end

    def fetch_tracks
      Euterpe::PROVIDERS.each_with_object({}) do |provider, tracks|
        tracks[provider[:name]] = fetch_for_provider(provider)
      end
    end

    def fetch_for_provider(provider)
      executor = "Euterpe::Providers::#{provider[:name].classify}::Fetching"
      Object.const_get(executor).fetch_track(query: @query, with_info: provider[:fetch_info])
    end
  end
end
