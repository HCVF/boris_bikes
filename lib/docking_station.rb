require_relative 'bike'

class DockingStation
  attr_accessor :bike_rack
  def initialize
    @bike_rack = []
  end

  def bike_rack
    @bike_rack
  end
  
  def release_bike
    return @bike_rack.pop if !@bike_rack.empty?
    return raise IndexError.new("no bikes")
  end

  def capacity
    capacity = 20
  end

  def dock(bike)
    return @bike_rack.push(bike) if @bike_rack.length < capacity
    return raise IndexError.new("rack full")
  end
end