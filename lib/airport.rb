require_relative "weather"

class Airport

	include Weather

	CAPACITY = 20

	def initialize(planes = [])
		@planes = planes
	end

	def has_plane?
		@planes.any?
	end

	def full?
		@planes.count >= CAPACITY
	end

	# allow landing sounds like a question.
	def allow_landing(plane)
		raise "This Airport is full" if full?
		raise "This flight cannot land due to weather conditions" if weather_stormy?
		# check your language, landed sounds like a question rather than a command
		# what about "land!" ?
		plane.landed!
		@planes << plane
	end

	def allow_departure
		raise "This flight cannot depart due to weather conditions" if weather_stormy?
		plane=@planes.pop
		plane.take_off!
	end



end
