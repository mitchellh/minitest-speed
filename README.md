# minitest-funcarg

This is an extension to [minitest](https://github.com/seattlerb/minitest)
which adds the ability to use funcargs as a method of test-level isolation.
Funcargs are a form of [dependency injection](http://en.wikipedia.org/wiki/Dependency_injection).

**WARNING:** This is a _proof of concept_. It works, but is not intended --
in its current form -- to be used for production tests.

## Example

### Defining And Using Funcargs

Define a test class:

```ruby
require "minitest/autorun"
require "minitest/unit"
require "minitest/funcarg"

class MyTest < MiniTest::Unit::TestCase
  def minitest_funcarg__number
    return 7
  end

  def test_things(number)
    assert number > 0
  end
end
```

Run them:

    $ ruby my_test.rb
    Started
    .
    Finished in 0.000343 seconds.

    1 tests, 1 assertions, 0 failures, 0 errors, 0 skips

The result is that the `number` parameter for `test_things` was given
as the number 7 since that is what the magic method
`minitest_funcarg__number` returned.
