module MyEnumerables
  def my_each

    return self unless block_given?

      for i in 0...length
      yield(self[i])
    end


    self
  end
end

class Array
  include MyEnumerables
end
