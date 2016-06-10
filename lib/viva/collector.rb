require 'http'
require 'json'
require 'viva/utils'
require 'viva/sample'

module Viva
  class Collector
    Result = Struct.new(:status, :samples) {
      def to_h
        data.to_h
      end

    }

    def initialize(timeout: 1)
      @http = HTTP.accept(:json).timeout(:global, read: timeout, write: timeout, connect: timeout)
    end

    attr_reader :http

    def call(station)
      response = http.get(station.to_url)
      data     = JSON.load(response.to_s)
      data     = data.fetch('GetSingleStationResult')
      samples  = data.fetch('Samples').map { |h| Viva::Sample.new(Viva::Utils.normalize_keys(h)) }
      Result.new(response.status, samples)
    end
  end
end
