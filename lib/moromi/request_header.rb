require 'moromi/request_header/version'
require 'moromi/request_header/config'
require 'moromi/request_header/core'
require 'moromi/request_header/default'

module Moromi
  module RequestHeader
    def self.configure(&block)
      yield config
    end

    # @return [Moromi::RequestHeader::Config]
    def self.config
      @config ||= Config.new
    end
  end
end
