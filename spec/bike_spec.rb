require 'bike'

describe Bike do

  it { is_expected.to respond_to :working? }

  it 'returns true when asked if working' do
    expect(subject).to be_working
  end

end
