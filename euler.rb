def euler(num)
  sum = 0
  for i in 0...num
    if i % 3 == 0 or i % 5 == 0 then
      sum += i
    end
  end
  puts sum
end

def fibonacci(num)
  x = 1
  y = 0
  for i in 0...num
    temp = y
    y += x
    x = temp
    puts y
  end
end
