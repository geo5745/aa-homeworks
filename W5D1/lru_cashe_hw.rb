class LRUCache

    attr_reader :max_size


    def initialize(num)
        @max_size = num
        @cache_arr = []

    end

    def count
      @cache_arr.length
    end

    def add(el)
      if self.count < max_size
        @cache_arr << el
      elsif @cache_arr.include?(el)
        idx = @cache_arr.index(el)
        @cache_arr.delete_at(idx)
        @cache_arr << el
      else
        @cache_arr.shift
        @cache_arr << el
      end
    end

    def show
      p @cache_arr
    end

    private
    # helper methods go here!

  end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show