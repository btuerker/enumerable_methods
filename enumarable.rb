module Enumarable
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

  end

  def my_none?

  end

  def my_count

  end

  def my_map

  end

  def my_inject

  end
end

