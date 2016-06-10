require 'spec_helper'
require 'viva'

describe Viva::Collector do
  let(:station) { Viva::Station.from_number(69) }
  let(:collector) { Viva::Collector.new }

  describe '#call' do
    it 'works' do
      result = collector.call(station)


      expect(result).to be_a(Viva::Collector::Result)


      File.open('data.log', 'a') { |file|
        result.samples.each do |sample|
          file.puts JSON.dump(Viva::SampleJSONSchema.call(sample.to_h))
        end
      }
    end
  end
end