require 'active_support/core_ext/string'

module Moromi
  module RequestHeader
    class Ios
      PROPERTIES = %i(
        token
        bundle_identifier
        bundle_version_string
        bundle_version
        os
        os_version
        device_model
        device_uuid
        seconds_from_gmt
        language_code
        region_code
      )

      attr_accessor *PROPERTIES

      def initialize(headers: {}, app_name: nil)
        @app_name = app_name || self.class::default_app_name

        names = self.class::header_names(app_name: @app_name)
        self.class::PROPERTIES.each do |property|
          name = names[property]
          send("#{property.to_s}=", headers[name]) rescue nil
        end
      end

      def to_hash
        {}.tap do |results|
          self.class::header_names(app_name: @app_name).invert.each do |k, v|
            results[k] = send(v) rescue nil
          end
        end
      end

      class << self
        def default_app_name
          Moromi::RequestHeader.config.app_name
        end

        def header_name(property, app_name: nil)
          header_names(app_name: app_name).fetch(property.to_sym, nil)
        end

        def header_names(app_name: nil)
          app_class_name = (app_name || default_app_name).classify

          {
            token: "X-#{app_class_name}-Token",
            bundle_identifier: "X-#{app_class_name}-Bundle-Identifier",
            bundle_version_string: "X-#{app_class_name}-Bundle-Version-String",
            bundle_version: "X-#{app_class_name}-Bundle-Version",
            os: "X-#{app_class_name}-Os",
            os_version: "X-#{app_class_name}-Os-Version",
            device_model: "X-#{app_class_name}-Device-Model",
            device_uuid: "X-#{app_class_name}-Device-Uuid",
            seconds_from_gmt: "X-#{app_class_name}-Seconds-From-Gmt",
            language_code: "X-#{app_class_name}-Language-Code",
            region_code: "X-#{app_class_name}-Region-Code"
          }
        end

        def create(app_name: nil, args: {})
          new(app_name: app_name).tap do |header|
            PROPERTIES.each do |property|
              header.send("#{property.to_s}=", args[property]) rescue nil
            end
          end
        end
      end
    end
  end
end
