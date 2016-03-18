def longest_comm_sub(string1, string2)
  subs1 = substrings(string1)
  subs2 = substrings(string2)

  common_subs = []

  subs1.each do |sub|
    common_subs << sub if subs2.include?(sub)
  end

  longest_sub = ""

  common_subs.each do |sub|
    longest_sub = sub if sub.length > longest_sub.length
  end

  longest_sub
end


def substrings(string)
  subs = []
  for i in 0..string.length - 1
    for j in i..string.length
      sub = string[i..j]
      subs << sub unless subs.include?(sub)
    end
  end
  subs
end
