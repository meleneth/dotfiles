class String
  def strip_leading_zeroes
    gsub(/^0+/, "")
  end

  def padded
    if match /^[0-9]$/
      return "0#{self}"
    end
    self
  end
end

