require 'garage'
require 'support/shared_examples_for_bike_container'

describe Garage do

  let(:bike) { double :bike }
  let(:bike2) { double :bike2 }

    describe '#fix_bike' do

      it 'fixes bikes and stores in working bikes' do
        allow(bike).to receive(:fix_bike)
        allow(bike2).to receive(:fix_bike)
        subject.broken_bikes.push(bike, bike2)
        subject.fix_bikes
        expect(subject.working_bikes.length).to eq 2
      end

      it 'after fixing all bikes broken bikes is empty' do
        allow(bike).to receive(:fix_bike)
        allow(bike2).to receive(:fix_bike)
        subject.broken_bikes.push(bike, bike2)
        subject.fix_bikes
        expect(subject.broken_bikes.length).to eq 0
      end

    end

    it_behaves_like BikeContainer
end
