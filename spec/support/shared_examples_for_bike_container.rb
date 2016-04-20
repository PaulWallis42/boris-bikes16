require 'bike_container'

shared_examples_for BikeContainer do
  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

  describe 'collecting bikes'

  let(:container_working) { double :container_working }
  let(:container_broken) { double :container_broken  }
  let(:bike) { double :bike }
  let(:bike2) { double :bike2 }

  it 'can collect and store working bikes' do
    allow(container_working).to receive(:working_bikes).and_return([bike, bike2])
    subject.collect_working_bikes(container_working)
    expect(subject.working_bikes).to eq [bike2, bike]
  end

  it 'can collect and store broken bikes' do
    allow(container_broken).to receive(:broken_bikes).and_return ([bike, bike2])
    subject.collect_broken_bikes(container_broken)
    expect(subject.broken_bikes).to eq [bike2, bike]
  end

  it 'will not allow itself to exceed it\'s capacity' do
    subject = described_class.new(1)
    allow(container_working).to receive(:working_bikes).and_return([bike, bike2])
    expect { subject.collect_working_bikes(container_working) }.to raise_error "Bike Storage Full"
  end

end
