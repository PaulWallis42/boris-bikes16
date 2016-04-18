require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike }

  describe 'initialization' do


    it 'defaults capacity' do
      allow(bike).to receive(:broken?)
      described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(bike) }.to raise_error 'Docking station full'
  end

end

  describe '#release_bike' do

    it { is_expected.to respond_to :release_bike }

    it 'can release a bike' do
      allow(bike).to receive(:broken?)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'will not release a broken bike' do
      allow(bike).to receive(:report_broken)
      allow(bike).to receive(:release_bike)
      allow(bike).to receive(:broken?).and_return(true)
      bike.report_broken
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do

    it 'docks a bike' do
      allow(bike).to receive(:broken?)
      subject.dock(bike)
      docked_bike = subject.bikes[0]
      expect(bike).to eq docked_bike
    end

    it 'raises an error when full' do
        allow(bike).to receive(:broken?)
        subject.capacity.times { subject.dock(bike) }
        expect { subject.dock(bike) }.to raise_error 'Docking station full'
    end

  end

end
