class Airport

	def initialize(planes = [])
		@planes = planes
	end

	def has_plane?
		@planes.any?
	end

	def allow_landing(plane)
		raise "This flight cannot land due to weather conditions" if weather_stormy?
		@planes << plane
	end

	def allow_departure(plane)
		raise "This flight cannot depart due to weather conditions" if weather_stormy?
		@planes.pop
	end

	def weather_stormy?
		[false, false, false, true].sample
	end

end