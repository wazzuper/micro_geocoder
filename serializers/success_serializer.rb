# frozen_string_literal: true

module SuccessSerializer
  extend self

  def call(result)
    {
      data: {
        lat: result.first,
        lon: result.last,
      },
    }.to_json
  end
end
