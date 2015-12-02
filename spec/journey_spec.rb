require 'journey'

describe Journey do


    subject(:journey) {described_class.new}
    let(:entry_station) {double :station}
    let(:exit_station) {double :station}

    describe '#journey_history' do

      it 'returns log history' do
        journey.start(entry_station)
        journey.end(exit_station)
        expect(journey.journey_log[1]).to eq [entry_station, exit_station]
      end
    end


end
