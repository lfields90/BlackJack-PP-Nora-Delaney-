#!/usr/bin/env ruby
require 'pry'

SUITS = ['♥', '♠', '♦', '♣']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  def face_card?
    ['K', 'Q', 'J'].include?(@rank)
  end
  def ace?
    ['A'].include?(@rank)
  end
end

class Deck
  attr_reader :collection
  def initialize
    @collection = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @collection << Card.new(value, suit)
      end
    end
    @collection.shuffle!
  end
  def draw!
    @collection.pop
  end
end

class Hand
  attr_accessor :cards, :deck, :score
  def initialize
    @cards = []
  end

  def score
    points = 0
    @cards.each do |card|
      if !card.ace? && !card.face_card?
        points += card.rank.to_i
      elsif card.face_card?
        points += 10
      else
        if points > 10
          points  += 1
        else
          points  += 11
        end
      end
    end
    points.to_i
  end
end


class Game
  attr_accessor :deck, :player_hand, :dealer_hand, :player_score, :dealer_score
  def initialize
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    @player_score = 0
    @dealer_score = 0
  end

  def deal
    2.times { player_hand.cards << deck.draw! }
    2.times { dealer_hand.cards << deck.draw! }
  end

  def busted?
    @player_score > 21
  end

  def calculate_score
    @player_score = player_hand.score
    @dealer_score = dealer_hand.score
  end

  def dealer_score
    dealer_hand.score
  end

  def play
    while true
    puts "Your score is #{@player_score}, would you like to Hit or Stand? (H/S)"
    input = gets.chomp.downcase
      if input == "h"
        player_hand.cards << deck.draw!
        calculate_score
      end
      break if input == "s" || busted?
    end
    puts  "Your score is #{@player_score} and dealers score is #{@dealer_score}"
  end
end



game = Game.new
game.deal
game.calculate_score
game.dealer_score
game.play
