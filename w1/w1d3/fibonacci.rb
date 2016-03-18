# require 'byebug'

def fibonacci_recursive(n)
  return [0, 1].take(n) if n <= 2
  # return [] if n == 0
  # return [0] if n == 1
  # return [0, 1] if n == 2
  prev_ary = fibonacci_recursive(n - 1)
  new_num = prev_ary[-1] + prev_ary[-2]
  prev_ary << new_num
end

def fibonacci_iterative(n)
  ary = [0, 1]
  
  return ary.take(n) if n <= 2

  (n - 2).times { ary << (ary[-1] + ary[-2]) }
  ary
end


if __FILE__ == $PROGRAM_NAME
  p fibonacci_recursive(4)
  p fibonacci_recursive(13)
  p fibonacci_iterative(13)
end
