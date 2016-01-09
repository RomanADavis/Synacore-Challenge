module VM
  $limit = 2**15
  $address = 0
  $registers = Array.new(8) {0}
  $stack = []
  $ops = []
  def cap(val)
    val < $LIMIT ? val : $REGISTERS[val % $LIMIT]
  end
  def store(register, val)
    $registers[register % $limit] = val
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
      store($a, @run.call($b, $c) % $limit)
      $address += @steps
    end
  end
  def op
    Op.new()
  end
  
  halt = Op.new(0, "halt") {break}
  set = Math.new(1, "set", 3) {|val| val}
  push = Op.new(2, "push", 2) {|val| $stack.push(cap(val))}
  pop = Op.new(3, "pop", 2) {|register| store(stack.pop)}
  eq = Math.new(4, "eq", 4) {|register, a, b| a == b ? 1 : 0}
  gt = Math.new(5, "gt", 4) {|register, a, b| a > b ? 1 : 0}
  jmp = Op.new(6, "jmp") {|address| $address = address}
  jt = Op.new(7, "jt") {|address, val| jmp.run(address) unless val == 0}
  jf = Op.new(8, "jf") {|address, val| jmp.run(address) if val == 0}
  add = Math.new(9,"add", 4) {|a, b| a + b}
  mult = Math.new(10,"mult", 4) {|register, a, b| a * b}
  mod = Math.new(11,"mult", 4) {|register, a, b| a % b}
  band = Math.new(12,"and", 4)
  bor = Math.new(13, "or", 4)
  bnot = Math.new(14, "not", 4)
  rmem = Math.new(15, "rmem", 2) {|address| $program[address]}
  wmem = Op.new(16, "wmem" 2) {|address, register| $program[address] = register}
  call = Op.new(17, "call") do |address| 
    jmp.run(address)
    $stack << $address + 2
  end
  ret = Op.new(18, "ret") {$address = $stack.pop}
  out = Op.new(19, "out", 2) {puts chr($address + 1)}
  in = Math.new(20, "in", 2) {ord(gets())}
  noop = Op.new(21, "noop", 1) {}
  
end
  class Machine
    in
  end
end