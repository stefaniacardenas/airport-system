class Plane

	def flying!
		@flying =true
	end

	def landed!
		@flying = false
	end

	# what is status used for?
	def status
		if flying!
			puts 'Flying'
		else
			puts 'Landed'
		end
	end
end
