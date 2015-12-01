require 'oystercard'

describe Oystercard do

  subject(:oystercard) {Oystercard.new}
  let(:max_balance) {Oystercard::DEFAULT_LIMIT}
  let(:max_balance_error) {Oystercard::MAX_BALANCE_ERROR}
  let(:min_balance_error) {Oystercard::MIN_BALANCE_ERROR}
  let(:rand_num) {rand(1..40)}


  describe '#initialize' do
    it 'has balance = 0' do
      expect(oystercard.balance).to eq 0
    end
  end


  describe '#top_up' do

    it 'allows user to top up' do
      expect{ oystercard.top_up(rand_num)}.to change { oystercard.balance }.by rand_num
    end

    it 'raises an error when balance exceeds £90' do
      oystercard.top_up(max_balance)
      expect{ oystercard.top_up(rand_num) }.to raise_error max_balance_error
    end

  end

  describe '#deduct' do
    it 'allows to deduct a fare from card' do
      oystercard.top_up(40)
      expect(oystercard.deduct(15)).to eq (25)
    end
  end

  describe '#touch_in' do
    it 'allows to start journey' do
      oystercard.top_up(rand_num)
      expect(oystercard).to respond_to(:touch_in)
    end

    it'raises an error if balance is 0' do
      expect {oystercard.touch_in}.to raise_error min_balance_error
    end
  end

  describe '#touch_out' do
    it 'allows to end journey' do
      oystercard.top_up(rand_num)
      expect(oystercard).to respond_to(:touch_out)
    end
  end

  context '#in_journey' do
    it 'returns status for touch in' do
      oystercard.top_up(rand_num)
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq true
    end

    it 'retuns status for touch_out' do
      oystercard.top_up(rand_num)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey?).to eq false
    end
  end




end
