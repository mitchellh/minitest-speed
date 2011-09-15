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

    $ ruby my_test.rb
TODO
