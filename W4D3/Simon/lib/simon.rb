require 'colorize'


class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game

  end

  def take_turn

    if !game_over
      show_sequence
      require_sequence
      round_success_message unless game_over
      self.sequence_length += 1 unless game_over
    end
  end

  def show_sequence
    add_random_color
    seq.each do |ele| 
      if ele == "blue"
        puts "blue".blue
      elsif ele == "red"
        puts "red".red
      elsif ele == "yellow"
        puts "yellow".yellow
      else
        puts "green".green
      end
      sleep(0.2)
    end
    sleep(1)
  end

  def require_sequence
    system("clear")
    puts "input sequence separated by a space: "
    input = gets.chomp
    words = input.split(" ")
    if words != seq
      self.game_over = true
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    p "Good Job"
  end

  def game_over_message
    p "Game Over, streak is #{sequence_length}"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

b = Simon.new
b.play
