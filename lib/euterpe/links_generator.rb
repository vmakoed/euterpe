# frozen_string_literal: true

require 'euterpe/providers/resolver'
require 'euterpe/providers/apple_music'
require 'euterpe/providers/spotify'
require 'euterpe/authentication'

require 'pry'

module Euterpe
  class LinksGenerator
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
      fetch_links
    end

    private

    def build_query
      Euterpe::Authentication.authenticate(service: @provider)
      query_builder = "Euterpe::Providers::#{@provider.classify}::QueryBuilding"
      Object.const_get(query_builder).fetch_query(source_link: @source_link)
    end

    def fetch_links
      providers = Euterpe::PROVIDERS.map { |provider| provider[:name] }
      providers.each_with_object({}) do |provider, links|
        executor = "Euterpe::Providers::#{provider.classify}::LinkGeneration"
        links[provider] = Object.const_get(executor).fetch_link(query: @query)
      end
    end
  end
end
