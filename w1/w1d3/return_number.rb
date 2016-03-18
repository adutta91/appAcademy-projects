def childs_savings_at_retirement(my_age)
  childs_age = my_age / 2
  childs_savings = childs_age ** 2
  years_until_retirement = 65 - childs_age
  childs_savings * years_until_retirement
end


if __FILE__ == $PROGRAM_NAME
  puts childs_savings_at_retirement(10)
end
