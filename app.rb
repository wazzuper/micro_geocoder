# frozen_string_literal: true

require 'sinatra/base'

class App < Sinatra::Base
  configure do
    set :app_file, File.expand_path('../config.ru', __dir__)
  end

  configure :development do
    set :show_exceptions, false
  end

  get '/' do
    result = Geocoder.call(params[:city])

    if !result.nil?
      status 200
      SuccessSerializer.call(result)
    else
      status 404
      FailureSerializer.call(status: 404)
    end
  rescue StandardError
    status 500
    FailureSerializer.call(status: 500)
  end
end
