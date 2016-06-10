require 'json'
require 'dry-types'


module Viva
  ISO8601 = Dry::Types['strict.string'].constructor { |t| t.iso8601 }

  SampleJSONSchema = Dry::Types['hash'].strict(
      name:      'strict.string',
      type:      'strict.string',
      heading:   'strict.int',
      value:     'strict.string',
      trend:     'strict.string',
      msg:       'strict.string',
      calm:      'strict.int',
      updated:   ISO8601,
      quality:   'strict.string',
      stationid: 'strict.int'
  )
  SampleSchema     = Dry::Types['hash'].strict(
      name:      'strict.string',
      type:      'strict.string',
      heading:   'strict.int',
      value:     'strict.string',
      trend:     'strict.string',
      msg:       'strict.string',
      calm:      'strict.int',
      updated:   Dry::Types['strict.time'].constructor { |x| Time.parse(x) },
      quality:   'strict.string',
      stationid: 'strict.int'
  )

  class Sample
    def initialize(hash)
      @data = SampleSchema.call(hash)
    end

    def [](key)
      @data.fetch(key)
    end

    def fetch(key)
      @data.fetch(key)
    end

    def time
      self[:updated]
    end

    def to_h
      @data.to_h
    end

    def pretty_print
      JSON.pretty_generate(@data)
    end
  end
end