# frozen_string_literal: true

module FailureSerializer
  extend self

  def call(status:)
    {
      data: {
        errors: [
          {
            detail: status == 404 ? 'City not found' : 'Bad request'
          },
        ],
      },
    }.to_json
  end
end
