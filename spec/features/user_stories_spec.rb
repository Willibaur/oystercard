 describe 'User Stories'  do

  let(:station) {Station.new}
  # let(:card) {Oystercard.new}
  # let(:journey) {Journey.new}
  let(:rand_num) {rand(1..40)}
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}


  #Step 12
  # In order to know where I have been
  # As a customer
  # I want to see all my previous trips
  it 'logs journeys' do
    card = Oystercard.new
    card.top_up(30)
    card.touch_in(:Victoria)
    card.touch_out(:Camden)
    card.touch_in(:Oxford_Street)
    card.touch_out(:Bond_Street)
    expect(card.journey.journey_log).to eq(1=>[:Victoria, :Camden], 2=>[:Oxford_Street, :Bond_Street])
  end

  # Step 13
  # In order to know how far I have travelled
  # As a customer
  # I want to know what zone a station is in
  it 'returns a zone number when a station is given' do
    station = Station.new
    expect(station.zone("Balham")).to eq 3
  end

# Step 14
# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out
  it 'charges a penalty when fail to touch in' do
    card = Oystercard.new
    card.top_up(40)
    expect{card.touch_out(:Camden)}.to change{card.balance}.by (-Oystercard::FINE)
  end

  it 'charges a penalty when fail to touch out' do
    card = Oystercard.new
    card.top_up(40)
    card.touch_in(:Bank)
    expect{card.touch_in(:Euston)}.to change{card.balance}.by (-Oystercard::FINE)
  end

end
