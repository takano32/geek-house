#! /usr/bin/env ruby
# author: takano32 <tak@no32.tk>
#


class Poker
end

class Poker::Hand
	def initialize(cards)
		@cards = cards
		@variants = nil
		p @cards
	end

	def sort_by_number!
		@cards = @cards.sort do |a, b|
			a.number - b.number
		end
	end

	def sort_by_suit!
		@cards = @cards.sort do |a, b|
			a.suit.ord - b.suit.ord
		end

	end

	def variants
		return 'straight flash' if straight_flash?
		return 'four of a kind' if four_of_kind?
		return 'full house' if full_house?
		return 'flush' if flush?
		return 'straight' if straight?
		return 'three of a kind' if three_of_kind?
		return 'two pair' if two_pair?
		return 'one pair' if one_pair?
		return 'high cards' if high_cards?
	end

        # 1:straight flash (As Ks Qs Js Ts)
	def straight_flash?
		sort_by_number!
		return false unless @cards[0].number == 1
		return false unless @cards[1].number == 10
		return false unless @cards[2].number == 11
		return false unless @cards[3].number == 12
		return false unless @cards[4].number == 13
		suits = @cards.map do |card|
			card.suit
		end
		return true if suits.uniq.size == 1
	end

        # 2:four of a kind (7s 7h 7d 7c As)
	def four_of_kind?
		sort_by_number!
	end

        # 3:full house (Ts Th Td 7c 7d)
	def full_house?
		sort_by_number!
	end

        # 4:flush (Ad 4d 5d Jd Kd)
	def flush?
		sort_by_suit!
	end

        # 5:straight (2s 3h 4s 5d 6c)
	def straight?
		sort_by_number!
	end

        # 6:three of a kind (9s 9h 9d Ts 3s)
	def three_of_kind?
		sort_by_number!
	end

        # 7:two pair (Ts Th 2c 2h 5d)
	def two_pair?
		sort_by_number!
	end

        # 8:one pair (2s 2d 5c 6d 9c)
	def one_pair?
		sort_by_number!
	end

        # 9:high cards (Ah Jc 5d 4s 9c)
	def high_cards?
		sort_by_number!
	end
end

class Poker::Card
	attr_reader :number, :suit
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
			else
				number = number.to_i
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
	return hand.variants
end

if __FILE__ == $0 then
	puts poke %w(As Ks Qs Js Ts)
	puts poke %w(7s 7h 7d 7c As)
	puts poke %w(Ts Th Td 7c 7d)
	puts poke %w(Ad 4d 5d Jd Kd)
	puts poke %w(2s 3h 4s 5d 6c)
	puts poke %w(9s 9h 9d Ts 3s)
	puts poke %w(Ts Th 2c 2h 5d)
	puts poke %w(2s 2d 5c 6d 9c)
	puts poke %w(Ah Jc 5d 4s 9c)
end

