module Bowling
	class Game

		def initialize
			@rolls = []
		end

		def roll(pins)
			@rolls << pins
		end

		def score
			score = 0
			roll_idx = 0
			10.times do
				if @rolls[roll_idx] == 10 #strike
					score += @rolls[roll_idx] #strike
					score += @rolls[roll_idx + 1] + @rolls[roll_idx + 2] #bonus
					roll_idx += 1
				elsif (@rolls[roll_idx] + @rolls[roll_idx + 1]) == 10 #spare
					score += @rolls[roll_idx] + @rolls[roll_idx + 1] #spare
					score += @rolls[roll_idx + 2] #bonus
					roll_idx += 2
				else
					score += @rolls[roll_idx] + @rolls[roll_idx + 1]
					roll_idx += 2
				end
			end
			score
		end

	end
end
