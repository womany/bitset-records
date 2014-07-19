# bitset-records

Bitset records, and can run operators with different length records.


## Install

You need to add this line in `Gemfile`, and then run `$ bundle install`.

    gem 'bitset-records', :git => 'git://github.com/womany/bitset-records'

## Usage

When you create a new record, you have to assign the size.

    record = BitsetRecords.new 16 # <BitsetRecords:0x0000010346dd00 @bit2str="10000000000000000">

### `add` / `remove`

Then, you can use `#add` to assign index with true, or use `#remove` to reset.

    record.add 14     # "10000000000000100"
    record.add 3,8    # "10010000100000100"

    record.remove 14  # "10010000100000000"

**IMPORTANT: for storing with decimal string with less length, this gem will prefix `'1'` at index 0.**

### `value` and `quantity`

You can get bitset to string value by using `#value`.

    record.value      # "10010000100000000"

You can count how many indexes in record by using `#quantity`.

    record.quantity   # 2

### `|` and `&`

You can run `|` or `&` operator for two different records. Especially it supports different length records.

When two records' lengths are different, it will choose the longer one automatically when operating.

    record1 = BitsetRecords.new 8   # <BitsetRecords:0x00000109c197b0 @bit2str="100000000">
    record2 = BitsetRecords.new 16  # <BitsetRecords:0x0000010355cfe0 @bit2str="10000000000000000">
    record1.add 3,7                 # "100100010"
    record2.add 14                  # "10000000000000100"
    record1 | record2               # "10010001000000100"

**IMPORTANT: When you run `|` or `&` operator, the result will modify receiver. In above example, record1 will change value.**

Here shows `record1` and `record2` current values.

    record1.value                   # "10010001000000100"
    record2.value                   # "10000000000000100"

##### Detail of operator

This part explains the `|` operator using above example.

First, this gem will detect the maximum length between record1 and record2, and then left shift with difference. In the beginning, `record1` length is 8.

    record1.value # "100100010"

In this example, it will be left shift 8 digits.

    record1.value # "10010001000000000"

Finally, run `|` operator.

    record1.value     # "10010001000000000"
    record2.value     # "10000000000000100"
    record1 | record2 # "10010001000000100"

### `store` and `recover`

You may want to save record value in decimal string.

    record1.store # "74244"

And then get back. Note that `#recover` is a class method.

    BitsetRecords.recover "74244" # "10010001000000100"

# Author

Copyright (c) 2014 Jerry Lee (@wildjcrt). All Rights Reserved. Released under the [MIT License](https://github.com/womany/bitset-records/blob/master/LICENSE).