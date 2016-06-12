require 'active_support/configurable'

module Moromi
  module RequestHeader
    class Config
      include ActiveSupport::Configurable

      config_accessor :app_name
    end
  end
end
