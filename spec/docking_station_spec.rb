require "docking_station"

describe DockingStation do

    it { is_expected.to respond_to :release_bike }

    it "returns a bike instance" do
      bike = Bike.new
      subject.bike_rack = [bike]
      expect(subject.release_bike).to be_an_instance_of(Bike)
    end

    it "output of release_bike method responds to working? method" do
      bike = Bike.new
      expect(bike.working?).to eq(true)
    end
    
    it "check if docking_station responds to dock" do
      expect(subject).to respond_to(:dock)
    end

    it "return_bike increases size of bike_rack array" do
      bike = Bike.new
      number_bikes = subject.bike_rack.length
      expect(subject.dock(bike).length).to eq(number_bikes + 1)
    end
    
    it "if user tries to take bike from empty rack they will get an error" do
      puts subject.bike_rack
      expect { subject.release_bike }.to raise_error(IndexError)
    end

    it "fails if user tries to dock bike in full rack" do
      bike = Bike.new
      subject.capacity.times { subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error(IndexError)
    end
end
