require 'minitest/autorun'
require './primes_matrix'


class TestMeme < MiniTest::Unit::TestCase

  def setup
    @pm = PrimesMatrix.new(5)
  end


  def test_is_prime
    assert_equal false, @pm.is_prime(1)
    assert_equal false, @pm.is_prime(4)
    assert_equal false, @pm.is_prime(104727)
    assert_equal true, @pm.is_prime(2)
    assert_equal true, @pm.is_prime(3)
    assert_equal true, @pm.is_prime(5)
    assert_equal true, @pm.is_prime(100183)
    assert_equal true, @pm.is_prime(104729)
  end


  def test_get_list_of_primes
    assert_equal [], @pm.get_list_of_primes(0)
    assert_equal [2], @pm.get_list_of_primes(1)
    assert_equal [2,3,5], @pm.get_list_of_primes(3)
    assert_equal [2,3,5,7,11,13,17,19,23,29], @pm.get_list_of_primes(10)
  end


  def test_print_primes_mult_table_1
    out, err = capture_io do
      @pm.print_primes_mult_table
    end
    assert_match "\n--\t2\t3\t5\t7\t11\t\n2\t4\t6\t10\t14\t22\t\n3\t6\t9\t15\t21\t33\t\n5\t10\t15\t25\t35\t55\t\n7\t14\t21\t35\t49\t77\t\n11\t22\t33\t55\t77\t121\t\n", out
  end


  def test_print_primes_mult_table_2
    pm2 = PrimesMatrix.new(3)
    out, err = capture_io do
      pm2.print_primes_mult_table
    end
    assert_match  "\n--\t2\t3\t5\t\n2\t4\t6\t10\t\n3\t6\t9\t15\t\n5\t10\t15\t25\t\n", out
  end


  #def test_mult_table
  #  assert_equal [["--", 2, 3, 5, 7, 11],
  #                [2, 4, 6, 10, 14, 22],
  #                [3, 6, 9, 15, 21, 33],
  #                [5, 10, 15, 25, 35, 55],
  #                [7, 14, 21, 35, 49, 77],
  #                [11, 22, 33, 55, 77, 121]], @pm.mult_table
  #end

end