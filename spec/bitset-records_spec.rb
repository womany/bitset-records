require 'rspec'
require 'bitset-records'
require 'pry'

describe BitsetRecords do
  it "creates a new record" do
    record = BitsetRecords.new(16)
    expect(record.value).to eq("10000000000000000")
  end

  it "compares two equal-length records" do
    record_1 = BitsetRecords.new(16)
    record_1.add(1,2)

    record_2 = BitsetRecords.new(16)
    record_2.add(2,3)

    expect(record_1 | record_2).to eq("11110000000000000")
  end

  it "compares two non-equal length records" do
    record_1 = BitsetRecords.new(16)
    record_1.add(1,2)

    record_2 = BitsetRecords.new(8)
    record_2.add(2,3)

    expect(record_1 | record_2).to eq("11110000000000000")
  end

  context "#add" do
    let(:record) { BitsetRecords.new(16) }
    it "fails when passed a string" do
      expect { record.add("2") }.to raise_error("Add accepts only integers")
    end
  end

  context "#remove" do
    let(:record) { BitsetRecords.new(16) }
    it "fails when passed a string" do
      expect { record.remove("2") }.to raise_error("Remove accepts only integers")
    end
  end
end