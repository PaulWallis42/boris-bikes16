class Van

  attr_reader :broken_bikes, :capacity, :working_bikes

  def initialize(capacity=20)
    @broken_bikes = []
    @capacity = capacity
    @working_bikes = []
  end

  def collect_broken_bikes(docking_station)
    while docking_station.broken_bikes.length > 0 do
      if broken_bikes.length + working_bikes.length < capacity
          broken_bikes << docking_station.broken_bikes.pop
      else
          fail 'Van is full'
      end
    end
  end

  def collect_working_bikes(garage)
    while garage.working_bikes.length > 0 do
      if working_bikes.length + broken_bikes.length < capacity
        working_bikes << garage.working_bikes.pop
      else
        fail 'Van is full'
      end
    end
  end

end
