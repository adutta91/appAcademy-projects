class Array
  def deep_dup
    # new_ary = []
    self.map do |el|
      if el.is_a?(Array)
        el.deep_dup
      else
        el
      end
    end
    # new_ary
  end
end

if __FILE__ == $PROGRAM_NAME
  inner = [1,2,3]
  outer = [5,6, inner, 7]
  duped_outer1 = outer.dup
  duped_outer2 = outer.deep_dup
  inner << "bad"
  outer
  p duped_outer1
  p duped_outer2
end
