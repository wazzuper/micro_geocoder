# frozen_string_literal: true

require './app'

ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

map '/geocode' do
  run App
end
