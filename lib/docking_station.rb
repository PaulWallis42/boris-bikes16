require_relative 'bike'
require_relative 'van'
require_relative 'garage'
require_relative 'bike_container'

class DockingStation
  include BikeContainer

  def release_bike
    fail 'No bikes available' if empty?
    working_bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    if bike.working?
      working_bikes << bike
    else
      broken_bikes << bike
    end
  end

  private

  def full?
    working_bikes.count + broken_bikes.count >= capacity
  end

  def empty?
    working_bikes.empty?
  end

end
