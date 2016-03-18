#recursion 1

def recursion_one(base, exp)
  return 1 if exp == 0
  base * recursion_one(base, exp - 1)
end

def recursion_two(base, exp)
  return 1 if exp == 0
  return base if exp == 1
  if exp.even?
    result = recursion_two(base, exp / 2)
    result *= result
  else
    result = recursion_two(base, (exp - 1) / 2)
    base * (result * result)
  end
end

if __FILE__ == $PROGRAM_NAME
  p recursion_one(2,2)
  p recursion_one(2,4)

  p recursion_two(2,2)
  p recursion_two(2,4)
end
