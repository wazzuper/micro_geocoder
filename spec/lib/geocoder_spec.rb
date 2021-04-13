# frozen_string_literal: true

require './lib/geocoder'

RSpec.describe Geocoder do
  subject { described_class }

  before { stub_const("#{described_class}::CSV_FILE", 'spec/fixtures/cities.csv') }

  describe '#call' do
    context 'existing city' do
      it 'returns coordinates' do
        result = subject.call('City 17')

        expect(result).to eq([45.05, 90.05])
      end
    end

    context 'missing city' do
      it 'returns a nil value' do
        result = subject.call('Missing')

        expect(result).to be_nil
      end
    end
  end
end
