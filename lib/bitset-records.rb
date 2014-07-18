require "version"

class BitsetRecords
  attr_accessor :bit2str

  def initialize(length)
    bit_array = Array.new(length+1, 0)
    bit_array[0] = 1
    @bit2str = bit_array.join
  end
  def value
    @bit2str
  end
end
