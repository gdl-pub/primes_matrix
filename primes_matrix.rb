class PrimesMatrix

  @primes_list = []


  def initialize(s)
    if ARGV[0]
      size = ARGV[0].to_i
    else
      size = s
    end
    @primes_list = get_list_of_primes(size)
  end


  def get_list_of_primes(size)
    primes_list = []
    i = 1
    j = 2
    while j
      if i>size
        break
      elsif is_prime(j)
        primes_list.push(j)
        i = i+1
      end
      j = j + 1
    end
    primes_list
  end


  def is_prime(num)
    if num<2
      return false
    end
    i = 2
    max = num
    while i <= max
      if i == num
        return true
      elsif num % i == 0
        return false
      else
        max = num / i
        i = i+1
      end
    end
    true
  end



  def print_primes_mult_table
    row_counter = 0
    size = @primes_list.length
    while row_counter <= size
      col_counter = 0
      while col_counter <= size
        if col_counter == 0 && row_counter == 0
          print "\n--\t"
        elsif col_counter == 0
          print "\n"
          print @primes_list[row_counter-1]
          print "\t"
        elsif row_counter == 0
          print @primes_list[col_counter-1]
          print "\t"
        else
          print @primes_list[col_counter-1] * @primes_list[row_counter-1]
          print "\t"
        end
        col_counter = col_counter + 1
      end
      row_counter = row_counter + 1
    end
    print "\n"
  end


end


a = PrimesMatrix.new(10).print_primes_mult_table