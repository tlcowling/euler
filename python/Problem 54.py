1 '''
  2 In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:
  3
  4 High Card: Highest value card.
  5 One Pair: Two cards of the same value.
  6 Two Pairs: Two different pairs.
  7 Three of a Kind: Three cards of the same value.
  8 Straight: All cards are consecutive values.
  9 Flush: All cards of the same suit.
 10 Full House: Three of a kind and a pair.
 11 Four of a Kind: Four cards of the same value.
 12 Straight Flush: All cards are consecutive values of same suit.
 13 Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
 14 The cards are valued in the order:
 15 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
 16
 17 If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.
 18
 19 Consider the following five hands dealt to two players:
 20
 21 Hand        Player 1            Player 2          Winner
 22 1       5H 5C 6S 7S KD      2C 3S 8S 8D TD      Player 2
 23         Pair of Fives       Pair of Eights
 24
 25 2       5D 8C 9S JS AC      2C 5C 7D 8S QH      Player 1
 26         Highest card Ace    Highest card Queen
 27
 28 3       2D 9C AS AH AC      3D 6D 7D TD QD      Player 2
 29         Three Aces          Flush with Diamonds
 30
 31 4       4D 6S 9H QH QC      3D 6D 7H QD QS      Player 1
 32         Pair of Queens      Pair of Queens
 33         Highest card Nine   Highest card Seven
 34
 35 5       2H 2D 4C 4D 4S      3C 3D 3S 9S 9D      Player 1
 36         Full House          Full House
 37         With Three Fours    with Three Threes
 38
 39 The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.
 40
 41 How many hands does Player 1 win?
 42 ''''
 43
 44 value = { '2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'T':10,'J':11,'Q':12,'K':13,'A':14 }
 45 all_kinds = tuple(reversed(sorted(value.values())))
 46 all_suits = list('DCSH')
 47
 48 def make_hand(cards):
 49     hand = {}
 50     for card in cards:
 51         hand.setdefault(value[card[0]], {})[card[1]] = 1
 52         hand.setdefault(card[1], {})[value[card[0]]] = 1
 53     return hand
 54
 55 def get(hash, arr): return ((i, hash.get(i, {})) for i in arr)
 56 def has(hash, arr): return not sum(1 for i in arr if i not in hash)
 57
 58 def rank(hand):
 59     # Royal flush
 60     for suit, kinds in get(hand, all_suits):
 61         if has(kinds, tuple('TJQKA')):
 62             return (9,)
 63
 64     # Straight flush
 65     for suit, kinds in get(hand, all_suits):
 66         kinds = sorted(kind for kind in kinds.keys())
 67         if len(kinds) == 5 and kinds[4] - kinds[0] == 4:
 68             return (8, kinds[0])
 69
 70     # Four of a kind
 71     for kind, suits in get(hand, all_kinds):
 72         if len(suits.keys()) == 4:
 73             return (7, kind)
 74
 75     # Full house
 76     for kind, suits in get(hand, all_kinds):
 77         if len(suits.keys()) == 3:
 78             for kind2, suits2 in get(hand, all_kinds):
 79                 if len(suits2.keys()) == 2:
 80                     return (6, kind, kind2)
 81
 82     # Flush
 83     for suit, kinds in get(hand, all_suits):
 84         if len(kinds.keys()) == 5:
 85             return (5,)
 86
 87     # Straight
 88     kinds = sorted(kind for kind in all_kinds if hand.has_key(kind))
 89     if len(kinds) == 5 and kinds[4] - kinds[0] == 4:
 90         return (4, kinds[0])
 91
 92     # Three of a kind
 93     for kind, suits in get(hand, all_kinds):
 94         if len(suits.keys()) == 3:
 95             return (3, kind)
 96
 97     # Two pairs
 98     for kind, suits in get(hand, all_kinds):
 99         if len(suits.keys()) == 2:
100             for kind2, suits2 in get(hand, all_kinds):
101                 if kind != kind2 and len(suits2.keys()) == 2:
102                     return (2, kind, kind2)
103
104     # One pair
105     for kind, suits in get(hand, all_kinds):
106         if len(suits.keys()) == 2:
107             return (1, kind)
108
109     for kind in all_kinds:
110         if kind in hand:
111             return (0, kind)
112
113     return 0
114
115
116 count = 0
117 for hand in open('poker.txt'):
118     hands = hand.split(' ')
119     p1, p2 = make_hand(hands[0:5]), make_hand(hands[5:10])
120     v1, v2 = rank(p1), rank(p2)
121     if v1 > v2: count += 1
122 print count