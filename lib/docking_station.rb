require_relative 'bike'

class DockingStation

  attr_reader :capacity, :bikes, :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    if bike.broken?
      broken_bikes << bike
    else
    bikes << bike
    end
  end

  private

  def full?
    bikes.count + broken_bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end
