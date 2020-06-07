class Cup
    attr_accessor :owner, :num_beads
    
    def initialize(owner,num_beads)
        @owner = owner
        @num_beads = num_beads
    end

    def pick_up_all
        @num_beads = 0
    end

    def deposit_one
        @num_beads += 1
    end

    def empty?
        @num_beads == 0
    end


end

class ScoreCup < Cup

end