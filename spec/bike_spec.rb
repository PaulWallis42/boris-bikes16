require 'bike'

describe Bike do

  describe '#broken?' do

    it 'returns false when asked if broken' do
      expect(subject).not_to be_broken
    end

    it 'can be reported as broken' do
      subject.report_broken
      expect(subject).to be_broken
    end

  end

  describe '#fix_bike' do

    it 'fixes a bike' do
      subject.report_broken
      subject.fix_bike
      expect(subject.broken?).to eq false
    end
    
  end
end
