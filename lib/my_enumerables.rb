module Enumerable
  # Your code goes here
  # Enumerable#my_each_with_index 	spec/my_each_with_index_spec.rb 	

  def my_each_with_index
    return self unless block_given?
    @i = 0
    while @i < length
      self.my_each do |item| 
        index = @i
      yield(item,index)
        @i += 1
      end
    end
    return self
  end


  # Enumerable#my_select 	spec/my_select_spec.rb 

  def my_select
    return self unless block_given?
    arr = []
    self.my_each do |item|
      arr << item if yield(item) 
    end
    arr
  end

  # Enumerable#my_all? 	spec/my_all_spec.rb 
  
  def my_all?
    arr = self.my_select {|item| yield(item)}
    arr.length == length
  end
  # Enumerable#my_any? 	spec/my_any_spec.rb 
  
  def my_any?
    arr = self.my_select {|item| yield(item)}
    arr.length > 0
  end
  # Enumerable#my_none? 	spec/my_none_spec.rb 	

  def my_none?
    arr = self.my_select {|item| yield(item)}
    arr.length == 0
  end
  # Enumerable#my_count 	spec/my_count_spec.rb 	
  def my_count
    if block_given? 
    arr = self.my_select {|item| yield(item)}
    arr.length
    else
      self.length 
    end
  end
  # Enumerable#my_map 	spec/my_map_spec.rb
  def my_map
    arr = []
    return self unless block_given?
    self.my_each do |item|
      arr << yield(item)
    end
    arr
  end

  # Enumerable#my_inject 	spec/my_inject_spec.rb 	
  def my_inject(acc = 0)
    self.my_each do |item|
      acc = yield(acc,item)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  # Array#my_each
  def my_each
    return self unless block_given?
    i = 0
    while i < size
      yield at(i)
      i += 1
    end
    return self
  end
end