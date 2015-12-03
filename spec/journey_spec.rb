require 'journey'

describe Journey do


    subject(:journey) {described_class.new}
    let(:entry_station) {double :station}
    let(:exit_station) {double :station}
    let(:entry_station2) {double :station}
    let(:exit_station2) {double :station}


    describe '#journey_history' do

      it 'returns log history' do
        journey.start(entry_station)
        journey.end(exit_station)
        journey.start(entry_station2)
        journey.end(exit_station2)
        expect(journey.journey_log[2]).to eq [entry_station2, exit_station2]
      end
    end


end
