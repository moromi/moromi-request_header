require 'moromi/request_header/version'
require 'moromi/request_header/config'
require 'moromi/request_header/ios'

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
