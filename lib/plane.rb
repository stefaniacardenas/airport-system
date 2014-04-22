class Plane

	def flying!
		@flying =true
	end

	def landed!
		@flying = false
	end

	def status
		if flying! 
			puts 'Flying'
		else 
			puts 'Landed'
		end
	end
end