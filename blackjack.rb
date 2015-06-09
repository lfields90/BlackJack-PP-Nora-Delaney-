#!/usr/bin/env ruby
require_relative 'card.rb'
require_relative 'deck.rb'
require_relative 'hand.rb'

SUITS = ['♥', '♠', '♦', '♣']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

class Game
 attr_accessor :deck, :player_hand, :dealer_hand, :player_score, :dealer_score
 def initialize
   @deck = Deck.new
   @player_hand = Hand.new
   @dealer_hand = Hand.new
   @player_score = 0
   @dealer_score = 0
 end

 def player_deal
   2.times do
     card = deck.draw!
     player_hand.cards << card
     calculate_score
       puts "Player was delt a #{card.rank}#{card.suit}"
   end
 end

 def dealer_deal
   2.times do
     card = deck.draw!
     dealer_hand.cards << card
     calculate_score
     puts "Dealer was dealt a #{card.rank}#{card.suit}"
   end
 end

 def hit
   puts
   card = deck.draw!
   player_hand.cards << card
   calculate_score
   puts "Player was dealt a #{card.rank}#{card.suit}"
 end

 def busted?
   player_score > 21 || dealer_score > 21
 end

 def player_blackjack?
   @player_score == 21
 end

 def dealer_blackjack?
   @dealer_score == 21
 end

 def calculate_score
   @player_score = player_hand.score
   @dealer_score = dealer_hand.score
 end

 def dealer_logic
   while @dealer_score < 17
     card = deck.draw!
     dealer_hand.cards << card
     calculate_score
     puts "\nDealer was dealt a #{card.rank}#{card.suit}"
     puts "Dealer score: #{@dealer_score}\n"
   end
   puts "\nDealer stands." unless @dealer_score >= 21
 end

 def win_statement
   if @player_score > 21
     puts "Player score: #{@player_score}\n"
     puts "BUSTED!!! Dealer wins."
   elsif player_blackjack?
     puts "You got Blackjack!!! You win!"
   elsif dealer_blackjack?
     puts "Dealer got Blackjack!!! You lose!"
   elsif @dealer_score > 21
     puts "Dealer Busted! You win!"
   elsif @player_score > @dealer_score
     puts "Player score: #{@player_score}"
     puts "Dealer score: #{@dealer_score}"
     puts "You win!"
   elsif @dealer_score > @player_score
     puts "Player score: #{@player_score}"
     puts "Dealer score: #{@dealer_score}"
     puts "You lose!"
   else
     puts "Player score: #{@player_score}"
     puts "Dealer score: #{@dealer_score}"
     puts "You tie."
   end
 end

 def play
   puts "Welcome to Blackjack!\n\n"
   player_deal
   until @player_score >= 21
     puts "Player score: #{@player_score}\n"
     print "\nHit or Stand? (H/S) "
     input = gets.chomp.downcase
       if input == "h"
         hit
       elsif input == "s"
         puts "\nPlayer stands."# at #{@player_score}"
         break
       else
         puts "Please select Hit or Stand"
       end
   end

   if @player_score < 22 && player_blackjack? == false
     puts
     dealer_deal
     puts "Dealer score: #{@dealer_score}\n"
     dealer_logic
     puts
   end
   win_statement
 end
end

game = Game.new
game.play
