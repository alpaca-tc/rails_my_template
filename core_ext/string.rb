class String
  def optimize(length=0, before=false)
    dup.optimize!(length, before)
  end

  def optimize!(length=0, before=false)
    replace "#{self}\n" unless match(/\n$/)
    first_line = self.split("\n").find { |line| line =~ /\w/ }
    indent = first_line.gsub(/^(\s*).*$/, '\1').length
    common_indnet = ' ' * indent

    gsub!(/^\s{#{indent}}/, '')
    gsub!(/^/, ' ' * length)
    replace("\n#{self}") if before
    self
  end
end
