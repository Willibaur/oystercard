require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}
  max_balance = described_class::DEFAULT_LIMIT
  let(:max_balance_error) {Oystercard::MAX_BALANCE_ERROR}

  describe '#initialize' do
    it 'has balance = 0' do
      expect(oystercard.balance).to eq 0
    end
  end


  describe '#top_up' do

    it 'allows user to top up' do
      expect{ oystercard.top_up(10)}.to change { oystercard.balance }.by 10
    end

    it 'raises an error when balance exceeds £90' do
      oystercard.top_up(max_balance)
      expect{ oystercard.top_up(1) }.to raise_error max_balance_error
    end

  end



end
