
# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  factors = []
  for i in 1 .. num
    factors << i if num % i == 0
  end
  factors
end

# p factors(10)

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&prc)
    for i in 0..self.length - 1
      for j in i..self.length - 1
        if prc.call(self[i], self[j]) == 1
          self[i], self[j] = self[j], self[i]
        end
      end
    end
    self
  end

  # p [4, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending

  def bubble_sort(&prc)
    result = self
    for i in 0..result.length - 1
      for j in i..result.length - 1
        if prc.call(result[i], result[j]) == 1
          result[i], result[j] = result[j], result[i]
        end
      end
    end
    result
  end
end

# p [4, 3, 5].bubble_sort { |num1, num2| num1 <=> num2 } #sort ascending


# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  subs = []
  for i in 0..string.length-1
    for j in i..string.length-1
      subs << string[i..j] unless subs.include?(string[i..j])
    end
  end
  subs
end

def subwords(word, dictionary)
  words = []
  subs = substrings(word)
  subs.each do |word|
    words << word if dictionary.include?(word)
  end
  words
end
