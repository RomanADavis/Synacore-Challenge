class Integer
  def store(register)
    VM.instance.registers[register % VM.instance.limit] = self
  end

  def cap
      limit = VM.instance.limit
      self < limit ? self : VM.instance.registers[val % limit]
  end

  def bin(val)
    self.to_i(2).rjust(15, "0")
  end
end