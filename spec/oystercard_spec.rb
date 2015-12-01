require 'oystercard'

describe Oystercard do

  subject(:oystercard) {Oystercard.new}
  let(:max_balance) {Oystercard::DEFAULT_LIMIT}
  let(:max_balance_error) {Oystercard::MAX_BALANCE_ERROR}
  let(:min_balance_error) {Oystercard::MIN_BALANCE_ERROR}
  let(:fare) {Oystercard::FARE}
  let(:rand_num) {rand(1..40)}
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}


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

  describe '#touch_in' do

    it'raises an error if balance is 0' do
      expect {oystercard.touch_in(entry_station)}.to raise_error min_balance_error
    end

  end

  describe '#touch_out' do

    it 'deducts fare from card' do
      oystercard.top_up(rand_num)
      expect {oystercard.touch_out(double)}.to change{oystercard.balance}.by (-fare)
    end
  end

  describe '#in_journey' do

    it 'returns status for touch in' do
      oystercard.top_up(rand_num)
      oystercard.touch_in(entry_station)
      expect(oystercard.in_journey?).to eq entry_station
    end

  end

  describe '#journey_log' do
    it 'stores entry station into hash map journey' do
      oystercard.top_up(rand_num)
      oystercard.touch_in(entry_station)
      expect(oystercard.journey["entry"]).to eq entry_station
    end

    it 'stores exit station into hash map journey' do
      oystercard.top_up(rand_num)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journey["exit"]).to eq exit_station
    end

  end





end
