class Hand
 attr_accessor :cards
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
       if points + 11 > 21
         points  += 1
       else
         points  += 11
       end
     end
   end
   points.to_i
 end
end
