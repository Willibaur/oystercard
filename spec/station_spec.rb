require 'station'

describe Station do

  subject(:station) {described_class.new}

  describe '#zone' do
    it 'returns zone number when station is given' do

      expect(station.zone("Balham")).to eq 3

    end
  end

end
