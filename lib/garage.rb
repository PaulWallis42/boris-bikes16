require_relative 'bike_container'

class Garage

  include BikeContainer

  def fix_bikes
    while broken_bikes.length > 0 do
      bike = broken_bikes.pop
      bike.fix_bike
      working_bikes << bike
    end
  end

end
