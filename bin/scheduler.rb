#!/usr/bin/env ruby
require 'bundler'
Bundler.setup

require_relative '../lib/viva'
require 'rufus-scheduler'

require 'sequel'


database_url = ENV.fetch('MYSQL_URL'){
  STDERR.puts('MYSQL_URL is missing')
  exit(-1)
}.sub('mysql://', 'mysql2://')
DB = Sequel.connect(database_url)


scheduler = Rufus::Scheduler.new

viva_station   = Viva::Station.from_number(68)
viva_collector = Viva::Collector.new

scheduler.every('30s', first_in: 0) {
  result = viva_collector.call(viva_station)


  result.samples.each do |sample|
    DB[:samples].insert(sample.to_h)
    puts JSON.dump(Viva::SampleJSONSchema.call(sample))
  end
}
scheduler.join