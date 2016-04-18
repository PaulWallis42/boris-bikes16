class Van

  attr_reader :broken_bikes, :capacity

  def initialize(capacity=20)
    @broken_bikes = []
    @capacity = capacity
  end

  def collect_broken_bikes(docking_station)
    while docking_station.broken_bikes.length > 0 do
      if broken_bikes.length < capacity
          broken_bikes << docking_station.broken_bikes.pop
      else
          fail 'Van is full'
      end
    end
  end

end
