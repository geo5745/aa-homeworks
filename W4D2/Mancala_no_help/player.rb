require_relative 'cup'

class Player

    attr_accessor :amount_in_hand, :name

    def initialize(name)
        @name = name
        @amount_in_hand = 0
    end

    def inspect
        self.name
    end

end