require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do

  let(:bike) { double :bike }
  let(:bike2) { double :bike2 }
  let(:van) { double :van }


  describe '#release_bike' do

    it { is_expected.to respond_to :release_bike }

    it 'can release a bike' do
      allow(bike).to receive(:working?).and_return true
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'will not release a broken bike' do
      allow(bike).to receive(:report_broken)
      allow(bike).to receive(:release_bike)
      allow(bike).to receive(:working?).and_return(false)
      bike.report_broken
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do

    it 'docks a bike' do
      allow(bike).to receive(:working?).and_return true
      subject.dock(bike)
      docked_bike = subject.working_bikes[0]
      expect(bike).to eq docked_bike
    end

    it 'raises an error when full' do
      allow(bike).to receive(:working?)
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Docking station full'
    end

  end

  it_behaves_like BikeContainer
end
