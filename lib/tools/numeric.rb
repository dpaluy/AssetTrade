class Numeric
  def percent_of(n)
    puts "#{self}/#{n}*100"
    self.to_f / n.to_f * 100.0
  end
  
  def percent_from(n)
    self.to_f * n / 100.0
  end
end
