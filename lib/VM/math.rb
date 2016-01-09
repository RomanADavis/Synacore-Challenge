class Math < Op
  def run
    store(@a, @run.call(@b, @c) % $limit)
    VM.instance.address += @steps
  end
end