class Airport

	def initialize(planes = [])
		@planes = planes
	end

	def has_plane?
		@planes.any?
	end

	def allow_landing(plane)
		raise "This flight cannot land due to weather conditions" if weather_stormy?
		plane.landed!
		@planes << plane
	end

	def allow_departure
		raise "This flight cannot depart due to weather conditions" if weather_stormy?
		plane=@planes.pop
		plane.take_off!
	end

	def weather_stormy?
		sunny = false
		stormy = true
		[sunny, sunny, sunny, stormy].sample
	end

end