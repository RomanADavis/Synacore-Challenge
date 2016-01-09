require "singleton"

class VM
  include Singleton
  @address = 0
  @address = 0
  @registers = Array.new(8) {0}
  @stack = []
  @limit = 2**15
  attr_accessor :address, :registers, :limit
  def run(program)
    @program = program
    while do
      code = @@opcodes[@program[@address]]
      break if code == 0 #halt
      code.run
    end
  end
end

def store(register, val)
  VM.instance.registers[register % VM.instance.limit] = val
end
def cap(val)
    limit = VM.instance.limit
    val < limit ? val : VM.instance.registers[val % limit]
end
class Op
  def initialize(code, name, steps = 0)
    @code, @steps, @name = code, steps, name
    @run = Proc.new yield
    @a, @b, @c = $program[$address + 1], cap($prgogram[$address + 2]), cap($program[$address + 3) 
  end
  def run
    @run.call(@a, @b, @c)
    $address += @steps
  end
end
  
class Math < Op
  def run
    store(@a, @run.call(@b, @c) % $limit)
    $address += @steps
  end
end