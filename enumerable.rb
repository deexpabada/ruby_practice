module Enumerable
  def my_each
    for i in self
      yield i
    end
  end

  def my_each_with_index
    for i in self
      yield i, self.index(i)
    end
  end

  def my_select
    result = []
    self.my_each {|i| result <<i if yield i}
    result
  end

  def my_all?
    result = true
    self.my_each {|i| result = false unless yield i}
    result
  end

  def my_any
    result = false
    self.my_each {|i| result = true if yield i}
    result
  end

  def my_none
    result = true
    self.my_each {|i| result = false if yield i}
    result
  end

  def my_count(*n)
    counter = 0
    if block_given?
      self.my_each {|i| counter += 1 if yield i}
    elsif n! = nil
      self.my_each {|i| counter +=1 if yield i == n}
    else
      self.my_each {|i| counter +=1}
    end
    counter
  end

  def my_map
    result = []
    self.my_each{|i| result << yield(i)}
    result
  end

  def my_inject
    self.my_each {|i| result = yield result, i}
    result
  end
end

def multiply_els(array)
  array.my_inject(1) {|product, number| product*number}
end
