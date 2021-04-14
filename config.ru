# frozen_string_literal: true

require_relative 'config/environment'

map '/geocode' do
  run App
end
