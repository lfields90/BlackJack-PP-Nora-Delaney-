#!/usr/bin/env ruby

class Card

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

SUITS = []
VALUES = []
  # to represent an individual playing card. This class should contain the suit and
  # the value and provide methods for determining what type of card
  # it is (e.g. face card or ace).
end

class Deck
  def initialize
  end
  # to represent a collection of 52 cards. When dealing a hand this
  # class can be used to supply the `Card` objects.
end

class Hand
  def initialize
  end
  # to represent the player's and dealer's hand. This class will need
  # to determine the best score based on the cards that have been dealt.
end
