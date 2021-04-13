# frozen_string_literal: true

require 'spec_helper'

ENV['RACK_ENV'] ||= 'test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
