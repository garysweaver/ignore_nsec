## Ignore Nsec

Have ever run into a strange problem in Ruby where two Time instances that looked the same were different? You may have run into the nanosecond precision problem.

The ignore_nsec gem takes care of that. With the gem, nanoseconds are still available via the `nsec` and other methods, but the `<=>` method on Time instances will ignore nanoseconds, which resolves problems caused by some operating systems providing nanosecond precision that is more precise than what the database accepts, so when you compare a time before persisting, then retrieve the record and compare times, the times will be different. For example, let's setup two times with different nanoseconds:

```ruby
# note: We are manually setting Time nsec here, so it isn't checking that
# your OS is returning nsec in the current time, nor is it checking your
# database stores or does not store nsec with (date)time.
#
a = Time.at(421.158888888)
b = Time.at(421.15888888)
a == b # => false
```

While using this gem, Time instances will return `to_i <=> other.to_i` if the object that a Time is being compared to looks like a Time (i.e. responds to `nsec`). Using the same example:

```ruby
a == b # => true
```

### Checking nsec

Run Time.now a few times in `irb` and see if it always seems to return the last three as '0' or if it has 6 or fewer significant digits (non-zero digits to the right of the decimal point). In OS X 10.9, I see that it does not support nanosecond precision in Time (by default, at least), e.g.:

```ruby
Time.now # => 220359000
```

In my Linux VM, it does use nsec precision, e.g.:

```ruby
Time.now # => 543686757
```

### Setup

In your Gemfile:

    gem 'ignore_nsec'

Then run:

    bundle install

### Performance

In testing, the revised `<=>` method only for the Time object seemed to be about 10x slower (0.00001029 sec vs. 0.00000105 sec). This is probably not a problem for small numbers of calls, but would become a concern if you were doing anything that required a lot of date comparisons, such as sorting millions of records in Ruby by time (vs. sorting in the database via query, which hopefully you would be able to do instead).

### License

Copyright (c) 2014 FineLine Prototyping, Inc., released under the [MIT license][lic].

[lic]: http://github.com/garysweaver/ignore_nsec/blob/master/LICENSE
