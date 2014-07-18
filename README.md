# bitset-records

Bitset records, and can run operators with different length records.


## Install

You need to add this line in `Gemfile`, and then run `$ bundle install`.

    gem 'bitset-records', :git => 'git://github.com/womany/bitset-records'

## Usage

When you create a new record, you have to assign the size.

    record = BitsetRecords.new 100

### `add` / `remove`

Then, you can use `#add` to assign index with true, or use `#remove` to reset.

    record.add 97
    record.add 3,8

    record.remove 97
    record.remove 3,8

### `value` and `quantity`

You can get bitset to string value by using `#value`.

    record.value

You can count how many indexes in record by using `#quantity`.

    record.quantity

### `|` and `&`

You can run `|` or `&` operator for two different records.

    record1 = BitsetRecords.new 100
    record1.add 3,8
    record2 = BitsetRecords.new 1000
    record2.add 947
    record1 | record2

IMPORTANT: When you run `|` or `&` operator, the result will modify receiver. In above example, record1 will change value.

# Author

Copyright (c) 2014 Jerry Lee (@wildjcrt). All Rights Reserved. Released under the [MIT License](https://github.com/womany/bitset-records/blob/master/LICENSE).