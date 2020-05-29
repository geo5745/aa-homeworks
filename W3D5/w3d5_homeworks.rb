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

class Queue
    def initialize
        @my_stack = []
    end

    def enqueue(el)
        @my_stack.push(el)
    end

    def dequeue
        @my_stack.shift
    end

    def peek
        @my_stack.first
    end
end


class Map
    def initialize
        @my_map = []
    end

    def set(key,value)
        key_idx = get_key_idx(key)
        if key_idx == nil
            @my_map << [key,value]
        else
            @my_map[key_idx][1] = value
        end
    end

    def get_key_idx(key)
        @my_map.each_with_index { |ele,i| return i if ele[0] == key}
        nil
    end

    def get(key)

    end

    def delete(key)
        
    end

end