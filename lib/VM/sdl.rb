require "./math.rb"
require "./binop.rb"

def op(code, name, steps)
  opcodes << Op.new(code, name, steps) yield
end

def math(code, name, steps)
  opcodes << Math.new(code, name, steps) yield
end

def binop(code, name, steps)
  opcodes << Binop.new(code, name, steps) yield
end