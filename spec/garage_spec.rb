require 'garage'

describe Garage do

  let(:van) { double :van }
  let(:bike) { double :bike }
  let(:bike2) { double :bike2 }
  let(:bike3) { double :bike3 }

    it 'responds to collect_broken_bikes' do
      expect(subject).to respond_to :collect_broken_bikes
    end

    describe '#collect_broken_bikes' do

      it 'can collect multiple bikes from a van' do
        allow(van).to receive(:broken_bikes).and_return([bike, bike2])
        garage = Garage.new(10)
        garage.collect_broken_bikes(van)
        expect(garage.broken_bikes[0]).to eq bike2
      end

      it 'has a capacity which it can not go over' do
        allow(van).to receive(:broken_bikes).and_return([bike, bike2, bike3])
        garage = Garage.new(2)
        expect{ garage.collect_broken_bikes(van) }.to raise_error 'Garage is Full'
      end

    end

end
