class Stack
    def initialize
      @my_stack = []
    end

    def push(el)
      @my_stack.push(el)
    end

    def pop
      @my_stack.pop
    end

    def peek
      @my_stack.last
    end
  end

  