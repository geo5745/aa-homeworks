def sluggish_octopus(arr)
    longest = ""
    
    arr.each_with_index do |ele,idx|
        (0...idx+1).each do |idx2|
            if ele.length > arr[idx2].length && ele.length > longest.length
                longest = ele
            end
        end
    end
    longest

end

arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']



def dominant_octopus(arr)
    arr.sort_by {|word| word.length}
    arr[-1]
end

def clever_octopus(arr)
    # longest = ""    
    # arr.each do |ele|
    #     longest = ele if ele > longest
    # end
    # longest
    arr.max.length
end
# puts
# start = Time.now
# p sluggish_octopus(arr)
# p (Time.now - start) *10000

# start = Time.now
# p dominant_octopus(arr)
# p (Time.now - start) * 10000

# start = Time.now
# p clever_octopus(arr)
# p (Time.now - start) * 10000

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = Hash.new(0)
tiles_array.each_with_index {|ele,idx| tiles_hash[ele] = idx}

def slow_dance(dir,arr)
    arr.index(dir)
end

puts
start = Time.now
p slow_dance("up", tiles_array) # 0
p (Time.now - start) * 100000
puts
start = Time.now
p slow_dance("right-down", tiles_array) #3
p (Time.now - start) * 100000

def fast_dance(dir,hash)
    hash[dir]
end

puts
start = Time.now
p fast_dance("up", tiles_hash) # 0
p (Time.now - start) * 100000
puts
start = Time.now
p fast_dance("right-down", tiles_hash) #3
p (Time.now - start) * 100000
