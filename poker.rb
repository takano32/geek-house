#! /usr/bin/env ruby
# author: takano32 <tak@no32.tk>
#


class Poker
end

class Poker::Hand
=begin
variants
        1:straight flash (As Ks Qs Js Ts) (*6)
        2:four of a kind (7s 7h 7d 7c As)
        3:full house (Ts Th Td 7c 7d)
        4:flush (Ad 4d 5d Jd Kd)
        5:straight (2s 3h 4s 5d 6c)
        6:three of a kind (9s 9h 9d Ts 3s)
        7:two pair (Ts Th 2c 2h 5d)
        8:one pair (2s 2d 5c 6d 9c)
        9:high cards (Ah Jc 5d 4s 9c)
=end
	def initialize(cards)
		@cards = cards
		@variants = nil
		p @cards
	end

	def straight_flash?
	end

	def four_of_kind?
	end

	def full_house?
	end

	def flush?
	end

	def straight?
	end

	def three?
	end

	def two?
	end
end

class Poker::Card
	Suits = [:s, :h, :d, :c]
	Numbers = (1..13).to_a
	def initialize(input)
		@number = 0
		@suit = nil
		input.scan(/(A|[2-9]|[TJQK])([shdc])/) do |number, suit|
			case number
			when 'A'
				number = 1
			when 'T'
				number = 10
			when 'J'
				number = 11
			when 'Q'
				number = 12
			when 'K'
				number = 13
			end
			@number = number
			@suit = suit.to_sym
		end
	end
end


def poke(inputs)
	cards = []
	inputs.each do |input|
		cards << Poker::Card.new(input)
	end
	hand = Poker::Hand.new(cards)
end

if __FILE__ == $0 then
	poke %w(As Ks Qs Js Ts)
end

