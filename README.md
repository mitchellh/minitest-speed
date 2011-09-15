# minitest-speed

This is an extension to [minitest](https://github.com/seattlerb/minitest)
which adds speed tests to the mix. Speed tests are simply methods which are
timed, and their timing date is outputted. If this timing data is saved somewhere,
it can be graphed later and viewed.

**WARNING:** This is a _proof of concept_. It works, but is not intended --
in its current form -- to be used for production tests.

## Example

### Defining And Using a Speed Test

Define a test class:

```ruby
require "minitest/autorun"
require "minitest/speed"

class MyTest < MiniTest::Speed::TestCase
  def test_speed_of_hash_creation
    Hash.new
  end
end
```

Run them:

    $ SPEED=1 ruby my_test.rb
    Started
    test_speed_of_hash_creation:   0.000000   0.000000   0.000000 (  0.000019)

    Finished in 0.000753 seconds.

    1 tests, 0 assertions, 0 failures, 0 errors, 0 skips

With `SPEED` set, only the speed tests are run, and their output is easily visible.
If `SPEED` is not set, then only non-speed tests are run.
