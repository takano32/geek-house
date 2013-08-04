#! /usr/bin/env ruby
# author: takano32 <tak@no32.tk>
#


class Poker
end

class Poker::Hand
end

class Poker::Card
	def initialize(input)
		@suits = [:s, :h, :d, :c]
		@numbers = (1..13).to_a
		p input
	end
end



if __FILE__ == $0 then
	cards = []
	%w(As Ks Qs Js Ts).each do |input|
		cards << Poker::Card.new(input)
	end
	p cards
end

