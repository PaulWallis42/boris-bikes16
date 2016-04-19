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

    describe '#fix_bike' do

      it 'can fix a bike' do
        allow(bike).to receive(:fix_bike)
        allow(bike).to receive(:broken?).and_return(false)
        subject.fix_bike(bike)
        expect(subject.working_bikes[0].broken?).to eq false
      end

      it 'can store the fixed bike' do
        allow(bike).to receive(:fix_bike)
        subject.fix_bike(bike)
        expect(subject.working_bikes[0]).to eq bike
      end

    end

end
