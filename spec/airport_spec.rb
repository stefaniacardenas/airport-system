require "airport"

describe Airport do
	let(:airport) {Airport.new}

		it "has no planes when new" do
			expect(airport).not_to have_plane
		end  

		it "can be created with planes" do 
			airport = Airport.new([:plane])
			expect(airport).to have_plane
		end

		it "is not full when created" do 
			expect(airport).not_to be_full
		end

	context "Traffic control" do
		let(:plane) {double :plane, landed!: :false}
		
		before do
			airport.stub(:weather_stormy?).and_return(false)
		end

		it "can accept a landing plane" do  
			expect(plane).to receive(:landed!)
			airport.allow_landing(plane)
	  end

	  it "cannot accept a landing plane if full" do
	  	times = (airport.class::CAPACITY)+1
			expect{times.times{airport.allow_landing(plane)}}.to raise_error(RuntimeError)
		end

		it "has planes after they land" do
			airport.allow_landing(plane)
			expect(airport).to have_plane
		end

		it "can allow a plane to depart" do
			airport.allow_landing(plane)
			expect(plane).to receive(:take_off!)
			airport.allow_departure
		end

		it "doesn't have planes after they depart" do
			expect(airport).not_to have_plane
		end
	end

	context "weather conditions" do
		before do
			airport.stub(:weather_stormy?).and_return(true)
		end

		it "cannot allow landing if weather is stormy" do 
			expect{airport.allow_landing(:plane)}.to raise_error(RuntimeError)
		end

		it "cannot allow departure if weather is stormy" do 
			expect{airport.allow_departure}.to raise_error(RuntimeError)
		end
	end

end

