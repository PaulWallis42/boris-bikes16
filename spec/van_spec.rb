require 'van'

describe Van do

  let(:docking_station) { double :docking_station }
  let(:bike) { double :bike }
  let(:bike2) { double :bike2 }
  let(:garage) { double :garage }

  describe '#collect_broken_bikes' do

    it { is_expected.to respond_to :collect_broken_bikes }

    it 'can collect bikes from a docking station' do
      allow(docking_station).to receive(:broken_bikes).and_return([bike])
      subject.collect_broken_bikes(docking_station)
      expect(subject.broken_bikes[0]).to eq bike
    end

    it 'can not collect more bikes than it\'s capacity' do
      allow(docking_station).to receive(:broken_bikes).and_return([bike, bike2])
      van = Van.new(1)
      expect { van.collect_broken_bikes(docking_station) }.to raise_error 'Van is full'
    end

  end

  describe '#collect_working_bikes' do

    it { is_expected.to respond_to :collect_working_bikes }

    it 'can store multiple working bikes in one collection' do
      allow(garage).to receive(:working_bikes).and_return([bike, bike2])
      subject.collect_working_bikes(garage)
      expect(subject.working_bikes.length).to eq 2
    end

    it 'will not take more bikes than it\'s capacity' do
      van = Van.new(1)
      allow(garage).to receive(:working_bikes).and_return([bike, bike2])
      expect { van.collect_working_bikes(garage) }.to raise_error 'Van is full'
    end

  end

end
