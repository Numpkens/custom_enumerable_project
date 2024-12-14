module Enumerable

def my_each_with_index
  i = 0
  while i < self.length
    yield(self[i], i)
    i+=1
  end
  self
end 

def my_select
  result[]
  my_each { |item| result << item if yield(item)}
  result
end

def my_all?
  my_each {|item| return false unless yield(item)}
  true
end

def my_any?
    my_each { |item| return true if yield(item) }
    false
  end

  def my_none?
    my_each { |item| return false if yield(item) }
    true
  end

  def my_count
    return self.length unless block_given?
    count = 0
    my_each { |item| count += 1 if yield(item) }
    count
  end

  def my_map
    result = []
    my_each { |item| result << yield(item) }
    result
  end

  def my_inject(initial = nil)
    array = self.to_a
    if initial.nil?
      accumulator = array[0]
      array = array[1..-1]
    else
      accumulator = initial
    end
    
    array.my_each { |item| accumulator = yield(accumulator, item) }
    accumulator
  end
end

class Array
  def my_each
    return to_enum(:my_each) unless block_given?
    
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end
end  

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
end
