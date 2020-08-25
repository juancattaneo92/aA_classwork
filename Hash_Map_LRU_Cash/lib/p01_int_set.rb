require "byebug"
class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
      if !validate!(num)
        self.store[num] = true 
      end 
      false
  end

  def remove(num)
    if self.store[num] == true
      self.store[num] = false
    end
  end

  def include?(num)
    if self.store[num] == true
      return true
    end 
    false
  end

  private

  def is_valid?(num)
    if num >= 0 && num <= @store.length - 1
      return true
    else 
      return false
    end 
  end

  def validate!(num)
    raise "Out of bounds" if is_valid?(num) == false 
  end
end

class IntSet
  
  attr_reader :store
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end
  
  def insert(num)
    #debugger
    if !(self.include?(num))
        self[num] << num
    end
  end
  
  def remove(num)
    if self.include?(num)
      self[num].pop(num)
    end
  end
  
  def include?(num)
    if self[num].include?(num)
      return true
    else
      return false
    end
  end
  
  private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
      @store[num % num_buckets]
    #i = num % num_buckets 
    
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
      if !(self.include?(num))
        self[num] << num 
        @count += 1
      end
      if @count >= num_buckets
        resize!
      end
  end

  def remove(num)
     if self.include?(num)
      self[num].pop(num)
      @count -= 1
    end
  end

  def include?(num)
    if self[num].include?(num)
      return true
    else
      return false
    end
  end

  # def inspect
  #   "#<Store:#{self.store}>"
  # end

  private

  def [](num)
      @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      # debugger
        old_store = @store.dup
        @count = 0
        @store = Array.new(num_buckets * 2) { Array.new }
        old_store.flatten.each do |num|
          self.insert(num)
        end
  end
end

#  (#<ResizingIntSet:0x00007f94be973c90>).resize!(*(any args))
#            expected: 1 time with any arguments
#            received: 0 times with any arguments