require 'byebug'

# base case:
#     ary = []
#
# length 1:
#     ary = [1]
#     subs = []
#     subs.concat (sub + [1])
#     returns => [[], [1]]
#
# length 2:
#     ary = [1, 2]
#     subs = [[], [1]]
#     subs.concat (subs + (each sub + [2]))
#     returns => [[], [1], [2], [1, 2]]


def subsets(ary)
  # base case
  return [[]] if ary.empty?

  # create subsets without the last element (smaller array)
  subs = subsets(ary.take(ary.length - 1))

  # adds the subs with the last element that was omitted.
  subs.concat( subs.map { |sub| sub + [ary.last] })

end


if __FILE__ == $PROGRAM_NAME
  p subsets([1, 2])
end
