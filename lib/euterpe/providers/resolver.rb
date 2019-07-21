# frozen_string_literal: true

module Euterpe
  module Providers
    module Resolver
      module_function

      def resolve(link:)
        validator = ->(provider) { link.include?(provider[:domain]) }
        Euterpe::PROVIDERS.find(&validator)[:name]
      end
    end
  end
end
