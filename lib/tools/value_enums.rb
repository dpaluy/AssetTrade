class Object
  def self.enums(*args)
    args.flatten.each_with_index do | const, i |
      class_eval %(#{const} = #{i})
    end
  end

  def self.bitwise_enums(*args)
    args.flatten.each_with_index do | const, i |
      class_eval %(#{const} = #{2**i})
    end
  end
end
