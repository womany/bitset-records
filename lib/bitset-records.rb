require "version"

class BitsetRecords
  attr_accessor :bit2str

  def initialize(length)
    bit_array = Array.new(length+1, 0)
    bit_array[0] = 1
    @bit2str = bit_array.join
  end

  def add(*args)
    args.compact!
    args.each do |id|
      @bit2str[id] = '1'
    end

    @bit2str
  end

  def remove(*args)
    args.compact!
    args.each do |id|
      @bit2str[id] = '0'
    end

    @bit2str
  end

  def value
    @bit2str
  end

  def quantity
    @bit2str.count('1') - 1
  end
end
