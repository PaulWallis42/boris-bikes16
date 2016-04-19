require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation

  attr_reader :capacity, :working_bikes, :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    working_bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    if bike.broken?
      broken_bikes << bike
    else
      working_bikes << bike
    end
  end

  def collect_working_bikes(van)
    while van.working_bikes.length > 0 do
      if working_bikes.length + broken_bikes.length < capacity
        working_bikes << van.working_bikes.pop
      else
        fail 'Docking Station Full'
      end
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
