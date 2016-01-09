class BinOp < Op
  def run
    (@run.call(@b.bin, @c.bin) % VM.instance.limit).store(@a)
    VM.instance.address += @steps
  end
end