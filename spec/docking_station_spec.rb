require "docking_station"

describe DockingStation do

    it { is_expected.to respond_to :release_bike }

    it "returns a bike instance" do
      bike = Bike.new
      subject.bike_rack = [bike]
      expect(subject.release_bike(bike)).to be_an_instance_of(Bike)
    end

    it "returns true when bike is broken" do
      bike = Bike.new
      bike.report_broken
      expect(bike.broken?).to eq(true)
    end
    
    it "check if docking_station responds to dock" do
      expect(subject).to respond_to(:dock)
    end

    it "dock increases size of bike_rack array" do
      bike = Bike.new
      number_bikes = subject.bike_rack.length
      expect(subject.dock(bike).length).to eq(number_bikes + 1)
    end
    
    it "if user tries to take bike from empty rack they will get an error" do
      puts subject.bike_rack
      bike = Bike.new
      expect { subject.release_bike(bike) }.to raise_error(IndexError)
    end

    it "fails if user tries to dock bike in full rack" do
      bike = Bike.new
      subject.capacity.times { subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error(IndexError)
    end

    it "returns capacity of 20 if no capacity is set" do
      expect(subject.capacity).to eq(2)
    end

    it "doesnt release a bike when the bike is broken" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      number_bikes = subject.bike_rack.length
      subject.release_bike(bike)
      expect(subject.bike_rack.length).to eq(number_bikes)
    end
end