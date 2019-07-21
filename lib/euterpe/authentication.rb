# frozen_string_literal: true

module Euterpe
  module Authentication
    module_function

    def authenticate(service:)
      provider_namespace = "Euterpe::Providers::#{service.classify}"
      authenticator = "#{provider_namespace}::Authentication"
      return unless Object.const_defined?(authenticator)

      Object.const_get(authenticator).authenticate
    end
  end
end
