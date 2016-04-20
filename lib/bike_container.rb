module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :working_bikes, :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @working_bikes = []
    @broken_bikes = []
  end

  def collect_working_bikes(container)
    while container.working_bikes.length > 0 do
      if working_bikes.length + broken_bikes.length < capacity
        working_bikes << container.working_bikes.pop
      else
        fail 'Bike Storage Full'
      end
    end
  end

  def collect_broken_bikes(container)
    while container.broken_bikes.length > 0 do
      if broken_bikes.length + working_bikes.length < capacity
          broken_bikes << container.broken_bikes.pop
      else
          fail 'Bike Storage Full'
      end
    end
  end


end
