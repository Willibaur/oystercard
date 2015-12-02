 describe 'User Stories'  do
#
#   # let(:station) {Station.new}
#   # let(:rand_num) {rand(1..40)}
#   # let(:entry_station) {double :station}
#   # let(:exit_station) {double :station}
#
#
# #Step 12
# # In order to know where I have been
# # As a customer
# # I want to see to all my previous trips
#
#   it 'logs journeys' do
#     card = Oystercard.new
#     card.top_up(30)
#     card.touch_in("Victoria")
#     card.touch_out("Camden")
#     card.touch_in("Oxford Street")
#     card.touch_out("Bond Street")
#     expect(card.journeys[1]).to eq ["Victoria", "Camden"]
#   end
#
# # # Step 13
# # # In order to know how far I have travelled
# # # As a customer
# # # I want to know what zone a station is in
# #
    it 'returns a zone number when a station is given' do
      station = Station.new
      expect(station.zone("Balham")).to eq 3
    end


# # Step 14
# # In order to be charged correctly
# # As a customer
# # I need a penalty charge deducted if I fail to touch in or out
#
     it 'returns history log' do
       journey = Journey.new
       journey.start("Victoria")
       journey.end("Camden")
       expect(journey.journey_log[1]).to eq ["Victoria", "Camden"]
     end
#
#
#
 end
