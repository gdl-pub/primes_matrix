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


  #@mult_table = []

  #def mult_table
  #  @mult_table
  #end

  #def generate_mult_table(list, size)
  #  mult_table = []
  #  row_counter = 0
  #  while row_counter <= size
  #    col_counter = 0
  #    row_array = []
  #    while col_counter <= size
  #      if col_counter == 0 && row_counter == 0
  #        row_array.push('--')
  #      elsif col_counter == 0
  #        row_array.push(list[row_counter-1])
  #      elsif row_counter == 0
  #        row_array.push(list[col_counter-1])
  #      else
  #        row_array.push(list[col_counter-1] * list[row_counter-1])
  #      end
  #      col_counter = col_counter + 1
  #    end
  #    mult_table.push(row_array)
  #    row_counter = row_counter + 1
  #  end
  #  mult_table
  #end

  #def print_mult_table
  #  row_counter = 0
  #  print "\n"
  #  while row_counter < @mult_table.length
  #    col_counter = 0
  #    while col_counter < @mult_table[row_counter].length
  #      print @mult_table[row_counter][col_counter]
  #      print "\t"
  #      col_counter = col_counter + 1
  #    end
  #    row_counter = row_counter + 1
  #    print "\n"
  #  end
  #  print "\n"
  #end

end


a = PrimesMatrix.new(10).print_primes_mult_table