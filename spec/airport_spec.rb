require "airport"

describe Airport do

	context "Airport features" do

		it "has no planes when new" do
			expect(Airport.new).not_to have_plane
		end  

		it "can be created with planes" do 
			airport = Airport.new([:plane])
			expect(airport).to have_plane
		end
	end

	context "Traffic control" do

		it "can accept a landing plane" do 
			plane = double :plane 
			airport = Airport.new([plane])
			airport.stub(:weather_stormy?).and_return(false)
			airport.allow_landing(plane)
	end

		it "has planes after they land" do
			plane = double :plane 
			airport = Airport.new([plane])
			airport.stub(:weather_stormy?).and_return(false)
			airport.allow_landing(plane)
			expect(airport).to have_plane
		end

			it "can allow a plane to depart" do
			plane = double :plane 
			airport = Airport.new([plane])
			airport.allow_departure(plane)
		end

			it "doesn't have planes after they depart" do
			plane = double :plane 
			airport = Airport.new([plane])
			airport.allow_departure(plane)
			expect(airport).not_to have_plane
		end
	end

	context "weather conditions" do

		it "cannot allow landing if weather is stormy" do 
			airport = Airport.new
			airport.stub(:weather_stormy?).and_return(true)
			expect(airport.weather_stormy?).to be_true
			expect{airport.allow_landing(:plane)}.to raise_error(RuntimeError)
		end

		it "cannot allow departure if weather is stormy" do 
			airport = Airport.new
			airport.stub(:weather_stormy?).and_return(true)
			expect(airport.weather_stormy?).to be_true
			expect{airport.allow_departure(:plane)}.to raise_error(RuntimeError)
		end

	end

end