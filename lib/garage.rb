class Garage

  attr_reader :broken_bikes, :capacity, :working_bikes

  def initialize(capacity=10)
    @broken_bikes = []
    @capacity = capacity
    @working_bikes = []
  end

  def collect_broken_bikes(van)
    while van.broken_bikes.length > 0 do
      if broken_bikes.length < capacity
        broken_bikes << van.broken_bikes.pop
      else
        fail 'Garage is Full'
      end
    end
  end

  def fix_bike(bike)
    bike.fix_bike
    working_bikes << bike
  end

end
