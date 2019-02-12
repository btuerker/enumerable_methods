module Enumerable
  def my_each
    for i in 0...self.length
      yield(self[i])
    end
  end

  def my_each_with_index(index)
    return self[index]
  end

  def my_select
    selected = []
    self.my_each { |e| selected.push(e) if yield(e) }
    selected
  end

  def my_all?
    self.my_each { |e| return false if !yield(e) }
    return true
  end

  def my_any?
    self.my_each { |e| return true if yield(e) }
    return false
  end

  def my_none?
    self.my_each { |e| return false if yield(e) }
    return true
  end

  def my_count
    count = 0
    self.my_each { |e| count += 1 }
    return count
  end

  def my_map proc = nil
    result = []
    if proc
      self.my_each { |e| result << proc.call(e) }
    else
      self.my_each { |e| result << yield(e) }
    end
    result
  end

  def my_inject result
    self.my_each { |e| result = yield(result,e) }
    return result
  end
end
