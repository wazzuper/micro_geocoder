# frozen_string_literal: true

# require './app'
require_relative 'config/environment'

# ENV['RACK_ENV'] ||= 'development'

# require 'bundler/setup'
# Bundler.require(:default, ENV['RACK_ENV'])

map '/geocode' do
  run App
end
