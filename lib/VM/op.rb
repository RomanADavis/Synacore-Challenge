require "./VM"
require "./helper_methods.rb"
class Op
  def initialize(code, name, steps = 0)
    @code, @steps, @name = code, steps, name
    @run = Proc.new yield
    address = VM.instance.address
    program = VM.instance.program
    @a, @b, @c = program[address + 1], program[address + 2].cap, program[address + 3].cap 
  end
  attr_accessor :code, :name, :steps
  def run
    @run.call(@a, @b, @c)
    VM.instance.address += @steps
  end
end