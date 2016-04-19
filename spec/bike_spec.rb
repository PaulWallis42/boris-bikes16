require 'bike'

describe Bike do

  describe '#working?' do

    it 'returns true when asked if working' do
      expect(subject).to be_working
    end

    it 'can be reported as broken' do
      subject.report_broken
      expect(subject).not_to be_working
    end

  end

  describe '#fix_bike' do

    it 'fixes a broken bike' do
      subject.report_broken
      subject.fix_bike
      expect(subject.working?).to eq true
    end

  end
end
