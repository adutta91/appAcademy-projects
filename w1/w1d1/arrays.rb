class Array
  def my_flatten
    result = []

    self.each do |el|
      if !el.is_a?(Array)
        result << el
      else
        result += el.my_flatten
      end
    end
    result
  end
  # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

  def my_zip(*args)
    dimension = self.length
    result = Array.new(dimension){Array.new(args.length+1)}

    self.each_with_index do |el, i|
      result[i][0] = el
    end

    for i in 0..args.length - 1
      args[i].each_with_index do |el, j|
        result[j][i+1] = el
      end
    end

    result
  end

  # p [4,5,6].my_zip([1,2],[8])
  def my_rotate(rotation = 1)
    if rotation < 0
      num = rotation.abs
      num.times do
        shifted_letter = self.pop
        self.unshift(shifted_letter)
      end
      return self
    end

    rotation.times do
      shifted_letter = self.shift
      self << shifted_letter
    end
    self
  end
  # a = [ "a", "b", "c", "d" ]
  # p a.my_rotate         #=> ["b", "c", "d", "a"]
  # p a.my_rotate(15)      #=> ["c", "d", "a", "b"]




  def my_join(space = "")
    str = ""

    self.each_with_index do |el, i|
      str += el
      str += space unless i == (self.length - 1)
    end
    str
  end
  # a = [ "a", "b", "c", "d" ]
  # p a.my_join("$")    # => "a$b$c$d"

  def my_reverse
    result = []
    self.each {|el| result.unshift(el)}
    result
  end

  p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]







end
