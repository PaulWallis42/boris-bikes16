require 'docking_station'
require 'capybara/rspec'

  feature 'member of public accesses bike' do

    scenario 'docking station releases a working bike' do
      docking_station = DockingStation.new
      bike = Bike.new
      docking_station.dock(bike)
      released_bike = docking_station.release_bike
      expect(released_bike).to be_working
    end

  end
