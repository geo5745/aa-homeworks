require 'colorize'
require_relative 'player'

class Board
    
    attr_accessor :array_of_cups, :current_player, :cup_index
    attr_reader :player1, :player2, :players

    def initialize
        @array_of_cups = Array.new(12)
        @player1 = Player.new("Player One")
        @player2 = Player.new("Player Two")
        @players = [player1, player2]
        @current_player = player1
        @cup_index = 0
    end

    def [](pos)
        self.array_of_cups[pos]
    end

    def []=(pos,cup)
        self.array_of_cups[pos] = cup
    end

    def create_cups
        self[0] =  ScoreCup.new(player1,0)
        (1..5).each {|i| self[i] = Cup.new(player1,4)}
        self[6] = ScoreCup.new(player2,0)
        (7..11).each {|i| self[i] = Cup.new(player2,4)}
    end

    def pick_up(idx)
        current_cup = self[idx]
        current_player.amount_in_hand += current_cup.num_beads
        current_cup.pick_up_all
        self.cup_index = idx + 1
    end

    def distribute
        amount_to_distrubute = self.current_player.amount_in_hand
        until amount_to_distrubute == 0
            current_cup = self[cup_index % 12]
            if current_cup.is_a?(ScoreCup) && current_cup.owner != self.current_player
                self.cup_index+=1
                next
            else
                current_cup.deposit_one
                self.cup_index+=1
                amount_to_distrubute -=1
            end
        end
        self.current_player.amount_in_hand = amount_to_distrubute
        self.cup_index = self.cup_index % 12
    end

    def make_move(idx)
        pick_up(idx)
        distribute
    end

    def valid_move?(idx)
        return false if self[idx].is_a?(ScoreCup)
        self[idx].owner == current_player
    end

    def switch_turn
        self.current_player == player1 ? self.current_player = player2 : self.current_player = player1
    end

    def game_ended?
        self[1..5].all? {|cup| cup.empty?} || self[7..11].all? {|cup| cup.empty?}
    end

    def winner
        if game_ended? && self[0].num_beads > self[6].num_beads
            "Player 1"
        elsif game_ended? && self[0].num_beads < self[6].num_beads
            "Player 2"
        else
            "Tie"
        end
    end

    def render
        arr1 = []
        arr2 = [self[0].num_beads,"",self[6].num_beads]
        arr3 = []
        (1..5).each {|i| arr1 << self[i].num_beads }
        (7..11).each {|i| arr3 << self[i].num_beads }
        arr2[1] = "                     "
        system("clear")
        puts
        puts ("   " + arr1.join(" - ")).red
        puts arr2.join("").yellow
        puts ("   " + arr3.join(" - ")).blue
        puts
    end

    def convert_index(idx)
        if current_player == player2
            idx+=5
        else
            idx
        end
    end

    def play
        create_cups
        until game_ended?
            render
            puts "#{current_player.name} - choose cup (1 - 5): "
            begin
                input = gets.chomp.to_i
                raise "Error" if !(1..5).to_a.include?(input)
            rescue
                "Incorrect input, try again"
                retry
            end
            idx = convert_index(input)
            make_move(idx)
            switch_turn
        end
        puts "The Winner is: #{winner}"
        puts "Player 1: #{self[0].num_beads} - #{self[6].num_beads} :Player 2"
    end

end

b = Board.new
b.play