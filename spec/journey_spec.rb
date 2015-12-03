require 'journey'

describe Journey do


    subject(:journey) {described_class.new}
    let(:entry_station1) {double :station}
    let(:exit_station1) {double :station}
    let(:entry_station2) {double :station}
    let(:exit_station2) {double :station}
    let(:journeyLog) {double :journeyLog, journey_history: nil}



      it 'stores single journeys' do
        journey.start(entry_station1)
        journey.end(exit_station1)
        expect(journey.single_journey).to eq [entry_station1, exit_station1]
      end

      it 'stores nil when no touch_in' do
        journey.end(exit_station1)
        expect(journey.single_journey).to eq [nil, exit_station1]
      end
end
