require 'oystercard'
require 'journey'

describe Oystercard do

  subject(:oystercard) {described_class.new}
  let(:rand_num) {rand(1..40)}
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:entry_station2) {double :station}
  let(:exit_station2) {double :station}


  describe '#top_up' do

    it 'allows user to top up' do
      expect{ oystercard.top_up(rand_num)}.to change { oystercard.balance }.by rand_num
    end

    it 'raises an error when balance exceeds £90' do
      oystercard.top_up(Oystercard::DEFAULT_LIMIT)
      expect{ oystercard.top_up(rand_num) }.to raise_error Oystercard::MAX_BALANCE_ERROR
    end
  end

  describe '#touch_in' do

    it 'raises an error when balance is 0' do
      expect {oystercard.touch_in(entry_station)}.to raise_error Oystercard::MIN_BALANCE_ERROR
    end

    it 'charges a fine when user does not touch in' do
      oystercard.top_up(Oystercard::DEFAULT_LIMIT)
      expect{oystercard.touch_out("exit_station")}.to change{oystercard.balance}.by (-Oystercard::FINE)
    end
  end

  describe '#touch_out' do

    it 'deducts fare from card' do
      oystercard.top_up(rand_num)
      oystercard.touch_in(entry_station)
      expect {oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by (-Oystercard::FARE)
    end
  end

  describe '#in_journey' do

    it 'returns status for touch in' do
      oystercard.top_up(rand_num)
      oystercard.touch_in(entry_station)
      expect(oystercard.in_journey?).to eq entry_station
    end
  end

  describe '#fare' do
    it 'returns minimum fare or penalty fare' do
      expect(oystercard.fare).to eq Oystercard::FARE
    end
  end
end
