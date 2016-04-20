require 'van'
require 'support/shared_examples_for_bike_container'

describe Van do

    it { is_expected.to respond_to :collect_broken_bikes }

    it { is_expected.to respond_to :collect_working_bikes }

 it_behaves_like BikeContainer

end
