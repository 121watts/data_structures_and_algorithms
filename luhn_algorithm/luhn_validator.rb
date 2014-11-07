class LuhnValidator

  def validate(account_number)
    acount_parser(account_number)
    answer
  end

  def account_parser(account_number)
    account_array = account_number.chars.map { |i| i.to_i }.push(0).reverse
  end

  def multiply_odd_indexes(account_array)
    multiplied = account_array.map.with_index do |ele, index|
      if index.odd?
        ele * 2
      else
        ele
      end
    end
    sum_double_digits(multiplied)
  end

  def sum_double_digits(multiplied)
    @all_nums = multiplied.map do |i|
      i.to_s.chars.map { |i| i.to_i }.reduce(:+)
    end
  end

  def answer
    10 - (@all_nums.reduce(:+) % 10)
  end

end
