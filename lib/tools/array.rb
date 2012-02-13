class Array
  
  def sum 
    inject(0) { |sum,x| sum + x }
  end

  def mean 
    sum.to_f / size.to_f
  end
end
