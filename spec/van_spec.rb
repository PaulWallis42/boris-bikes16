require 'van'

describe Van do

  let(:docking_station) { double :docking_station }
  let(:bike) { double :bike }
  let(:bike2) { double :bike2}

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

end
