# frozen_string_literal: true

require 'csv'

module Geocoder
  extend self

  def call(city)
    data[city]
  end

  private

  CSV_FILE = 'lib/cities.csv'

  private_constant :CSV_FILE

  def data
    @data ||= load_data!
  end

  def load_data!
    file = File.join(File.expand_path('..', __dir__), CSV_FILE)

    @data = CSV.read(file, headers: true).inject({}) do |result, row|
      city = row['city']
      lat = row['geo_lat'].to_f
      lon = row['geo_lon'].to_f
      result[city] = [lat, lon]
      result
    end
  end
end
