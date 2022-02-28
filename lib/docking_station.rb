require_relative 'bike'

class DockingStation
  attr_accessor :bike_rack, :capacity
  
  def initialize(capacity = 2)
    @bike_rack = []
    @capacity = capacity
  end

  def bike_rack
    @bike_rack
  end

  def release_bike(bike)
    return raise IndexError.new("no bikes") if bike_rack.empty?
    return @bike_rack.pop unless bike.broken?
    
  end

  def dock(bike)
    return raise IndexError.new("rack full") if full?
    bike.broken?
    @bike_rack.push(bike)
  end

  private
  
  def full?
    @bike_rack.length == capacity
  end

  def empty?
    @bike_rack.length == 0
  end
end
