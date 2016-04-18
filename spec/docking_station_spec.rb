require 'docking_station'

describe DockingStation do

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
    end
    expect{ subject.dock(bike) }.to raise_error 'Docking station full'
  end
end

  describe '#release_bike' do

    it { is_expected.to respond_to :release_bike }

    it 'can release a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'will not release a broken bike' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'only returns 1 working bike at a time' do
      10.times { subject.dock(Bike.new) }
      subject.release_bike
      expect(subject.bikes.length).to eq 9
    end

  end

  describe '#dock' do

    it 'docks something' do
      bike = Bike.new
      subject.dock(bike)
      docked_bike = subject.bikes[0]
      expect(bike).to eq docked_bike
    end

    it 'raises an error when full' do
        subject.capacity.times { subject.dock Bike.new }
        expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end


  end

end
