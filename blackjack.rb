#!/usr/bin/env ruby
require 'pry'

SUITS = ['hearts', 'spades', 'diamonds', 'clubs']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

class Card
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  def face_card?
    ['K', 'Q', 'J'].include?(@rank)
  end
end

binding.pry

class Deck
  def initialize
    @collection = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @collection << Card.new(value, suit)
      end
    end
    @collection.shuffle!
    binding.pry
  end

  def draw!
    @collection.pop
  end
end

class Hand
  def initialize
  end
  # to represent the player's and dealer's hand. This class will need
  # to determine the best score based on the cards that have been dealt.
end

Deck.new
