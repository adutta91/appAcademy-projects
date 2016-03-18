def range_recursive(start, finish)
  if finish > start
    [start] + range_recursive(start + 1, finish)
  else
    []
  end
end

def range_iter(start, finish)
  result = []
  (finish-start).times { |i|  result << start + i }
  result
end

if __FILE__ == $PROGRAM_NAME
  p range_recursive(1,4)
  p range_recursive(4,1)
  p range_iter(1,4)
  p range_iter(4,1)
end
