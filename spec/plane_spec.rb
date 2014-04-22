require "plane"

describe Plane do 
	let(:plane) {Plane.new}
	it "has a 'flying' status when created and is in the air" do 
		plane.flying!
	end

	it "flies when it's on the air" do
		expect(plane.flying!).to be_true
	end

	it "doesn't fly after landing" do 
		expect(plane.landed!).to be_false
	end

	it "changes its status every time it lands or flies" do 
		plane.status
		expect(plane.flying!).to eq true
	end

end
