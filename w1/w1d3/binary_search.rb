require 'byebug'

def bsearch(array, target)

  # base case
  return nil if array.length == 1 && array[0] != target

  # determines pivot
  pivot = (array.length) / 2
  right = array[pivot..-1]
  left = array[0..pivot-1]

  # returns if found target
  if array[pivot] == target
    return pivot
  end

  
  if target > array[pivot]
    right_half_result = bsearch(right, target)
    if right_half_result.nil?
      return nil
    else
      return pivot + right_half_result
    end
  elsif target < array[pivot]
    return bsearch(left,target)
  end
end

if __FILE__ == $PROGRAM_NAME
  p bsearch([2, 4, 6, 8, 10], 2)
  p bsearch([2, 4, 6, 8, 10], 4)
  p bsearch([2, 4, 6, 8, 10], 6)
  p bsearch([2, 4, 6, 8, 10], 8)
  p bsearch([2, 4, 6, 8, 10], 10)
  p bsearch([2, 4, 6, 8, 10], 7)
end
