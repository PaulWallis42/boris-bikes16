require 'bike'

describe Bike do

  describe '#working?' do

  it { is_expected.to respond_to :working? }

  it 'returns true when asked if working' do
    #expect(sujbect.working?).to eq true
    expect(subject).to be_working
  end

  it 'can be reported as broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

end

end
