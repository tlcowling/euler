#!/usr/bin/ruby
require "problem17"
require "test/unit"

class TestNumberConverter < Test::Unit::TestCase
  def wordFor(num)
    NumberNamer.new(num).inWords
  end

  def test_number_letters
    assert_equal(number_letters("jean paul jackety"), 15)
  end

  def test_one
    word = wordFor(1)
    assert_equal("one", word)
    assert_equal(3, number_letters(word))
  end

  def test_two
    assert_equal("two", wordFor(2))
  end

  def test_seventeen
    word = wordFor(17)
    assert_equal("seventeen", word)
    assert_equal(9, number_letters(word))
  end

  def test_eighteen
    word = wordFor(18)
    assert_equal("eighteen", word)
    assert_equal(8, number_letters(word))
  end

  def test_twenty
    word = wordFor(20)
    assert_equal("twenty", word)
    assert_equal(6, number_letters(word))
  end
  
  def test_twenty_one
    assert_equal("twenty-one", wordFor(21))
  end

  def test_thirty
    word = wordFor(30)
    assert_equal("thirty", word)
    assert_equal(6, number_letters(word))
  end

  def test_ninety_nine
    assert_equal("ninety-nine", wordFor(99))
  end

  def test_one_hundred
    word = wordFor(100)
    assert_equal("one hundred", word)
    assert_equal(10, number_letters(word))
  end

  def test_one_hundred_and_one
    assert_equal("one hundred and one", wordFor(101))
  end

  def test_one_hundred_and_fifteen
    word = wordFor(110)
    assert_equal("one hundred and ten", word)
    assert_equal(16, number_letters(word))
  end

  def test_one_hundred_and_fifteen
    word = wordFor(115)
    assert_equal("one hundred and fifteen", word)
    assert_equal(20, number_letters(word))
  end

  def test_one_hundred_and_twenty_one
    word = wordFor(121)
    assert_equal("one hundred and twenty-one", word)
    assert_equal(22, number_letters(word))
  end

  def test_one_hundred_and_thirty
    word = wordFor(130)
    assert_equal("one hundred and thirty", word)
    assert_equal(19, number_letters(word))
  end

  def test_two_hundred
    word = wordFor(200)
    assert_equal("two hundred", word)
    assert_equal(10, number_letters(word))
  end

  def test_two_hundred
    word = wordFor(201)
    assert_equal("two hundred and one", word)
    assert_equal(16, number_letters(word))
  end

  def test_three_hundred_and_forty_two
    word = wordFor(342)
    assert_equal("three hundred and forty-two", word)
    assert_equal(23, number_letters(word))
  end

  def test_nine_hundred_and_ninety_nine
    assert_equal("nine hundred and ninety-nine", wordFor(999))
  end

  def test_thousand
    word = wordFor(1000)
    assert_equal("one thousand", word)
    assert_equal(11, number_letters(word))
  end
end
