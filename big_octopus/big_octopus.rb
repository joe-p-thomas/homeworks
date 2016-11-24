
### Octopus wants to find largest fish in array.
arr = ['fish', 'fissh', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#bubble sort method
def sluggish_octopus(arr)
  0.upto(arr.length - 2) do |i|
    if arr[i].length > arr[i + 1].length
      arr[i], arr[i + 1] = arr[i + 1], arr[i]
    end
  end
  arr.last
end
p sluggish_octopus(arr)

# altered merge sort method
def dominant_octopus(arr)
  return "" if arr.empty?
  return arr[0] if arr.length == 1

  mid = arr.length / 2
  left = dominant_octopus(arr.take(mid))
  right = dominant_octopus(arr.drop(mid))
  left.length > right.length ? left : right
end
p dominant_octopus(arr)

# O(n) time
def clever_octopus(arr)
  largest_fish = ""
  arr.each do |fish|
    largest_fish = fish.length > largest_fish.length ? fish : largest_fish
  end
  largest_fish
end
p clever_octopus(arr)


### Dancing octopus. Find the index of the moves array that corresponds
### to the given move.

# Slow Dance
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |dir, index|
    return index if direction == dir
  end
end

# Constant Dance
tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
               "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }
def constant_dance(direction, tiles_hash)
  tiles_hash[direction]
end
