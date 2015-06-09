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
