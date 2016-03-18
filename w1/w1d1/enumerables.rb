class Array

  def my_each(&blk)
    # for loop method
    # for i in 0..self.length-1
    #   blk.call(self[i])
    # end

    # self.length.times
    self.length.times do |i|
      blk.call(self[i])
    end
  end

  # [1,2,3].my_each do |num|
  #   puts num
  # end


  def my_select(&blk)
    result = []

    self.my_each do |el|
      result << el if blk.call(el)
    end
    result
  end

  # p [1,2,3].my_select {|num| num % 2 == 0}

  def my_reject(&blk)
    result = []

    self.my_each do |el|
      result << el unless blk.call(el)
    end
    result
  end

  # p [1,2,3].my_reject {|num| num % 2 == 0}

  def my_any?(&blk)
    self.my_each do |el|
      return true if blk.call(el)
    end
    false
  end

  # p [1, 2, 3].my_any? { |num| num == 4 }

  def my_all?(&blk)
    self.my_each do |el|
      return false unless blk.call(el)
    end
    true
  end

  # p [1, 2, 3].my_all? { |num| num < 4 }
end
