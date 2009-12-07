module Bowling
	class RollCursor
		def initialize(rolls)
			@rolls = rolls
			@idx = 0
		end

		def strike?
			self.roll == 10
		end

		def spare?
			self.two_rolls == 10
		end

		def pins
		  if self.strike?
				self.roll
			else
				self.two_rolls
			end
		end

		def bonus
			if self.strike?
				self.clone.next.two_rolls
			elsif self.spare?
				self.clone.next.roll
			else
				0
			end
		end

		def score
			self.pins + self.bonus
		end

		def roll
			@rolls[@idx]
		end

		def two_rolls
			@rolls[@idx] + @rolls[@idx+1]
		end

		def next
			if  self.strike?
				@idx += 1
			else 
				@idx += 2
			end
			self
		end
	end

	class Game
		def initialize
			@rolls = []
		end

		def roll(pins)
			@rolls << pins
		end

		def score
			score = 0
			cur = RollCursor.new(@rolls)
			10.times do
				score += cur.score
#				score += cur.pins
#				score += cur.bonus
				cur.next
			end
			score
		end
	end
end
