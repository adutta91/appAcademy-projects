require 'byebug'

def merge_sort(ary)
  #base case
  if ary.length < 2
    return ary
  end

  half = ary.length / 2
  left = merge_sort(ary[0..half-1])
  right = merge_sort(ary[half..-1])

  merge(left, right)

end

def merge(left, right)
  new_ary = []
  until left.empty? || right.empty?
    if left.first > right.first
      new_ary << right.shift
    else
      new_ary << left.shift
    end
  end
  new_ary += right + left
  return new_ary.compact
end



if __FILE__ == $PROGRAM_NAME
  shuffled_ary = (1..100).to_a.shuffle
  p shuffled_ary
  p merge_sort(shuffled_ary)
  # p merge([1,6,3],[2,5,4])
end
