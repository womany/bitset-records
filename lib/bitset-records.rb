require "version"

class BitsetRecords
  attr_accessor :bit2str

  def initialize(length)
    bit_array = Array.new(length+1, 0)
    bit_array[0] = 1
    @bit2str = bit_array.join
  end

  def self.recover(str)
    @bit2str = str.to_i.to_s(2)
  end

  def |(record2)
    bstring1 = value
    bstring2 = record2.value

    # left shift operator
    length_diff = (bstring1.length - bstring2.length).abs
    unless length_diff == 0
      if bstring1.length > bstring2.length
        bstring2 = (bstring2.to_i(2) << length_diff).to_s(2)
      else
        bstring1 = (bstring1.to_i(2) << length_diff).to_s(2)
      end
    end

    @bit2str = (bstring1.to_i(2) | bstring2.to_i(2)).to_s(2)
  end

  def &(record2)
    bstring1 = value
    bstring2 = record2.value

    # left shift operator
    length_diff = (bstring1.length - bstring2.length).abs
    unless length_diff == 0
      if bstring1.length > bstring2.length
        bstring2 = (bstring2.to_i(2) << length_diff).to_s(2)
      else
        bstring1 = (bstring1.to_i(2) << length_diff).to_s(2)
      end
    end

    @bit2str = (bstring1.to_i(2) & bstring2.to_i(2)).to_s(2)
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

  def store
    @bit2str.to_i(2).to_s
  end
end
