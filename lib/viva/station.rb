require "addressable/template"

module Viva
  class Station
    URL_TEMPLATE = Addressable::Template.new("https://services.viva.sjofartsverket.se:8080/output/vivaoutputservice.svc/vivastation/{stationid}")

    def initialize(number:)
      @number = number
    end

    attr_reader :number

    def to_url
      URL_TEMPLATE.expand('stationid' => @number)
    end

    class << self
      def from_number(number)
        new(number: number.to_i)
      end
    end
  end
end