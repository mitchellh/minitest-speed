require "benchmark"
require "minitest/unit"

module MiniTest
  module Speed
    # This is the superclass that speed tests must inherit from.
    class TestCase < MiniTest::Unit::TestCase
      def run(runner)
        time = Benchmark.measure do
          super
        end

        time = "ERROR" if !self.passed?
        return "#{self.__name__}: #{time}\n"
      end
    end
  end
end

module MiniTest
  module SpeedHacks
    def self.included(cls)
      cls.extend(ClassMethods)

      # Yeah, this is an alias_method_chain. Don't judge me.
      cls.class_eval do
        class << self
          alias_method :test_suites_without_speed, :test_suites
          alias_method :test_suites, :test_suites_with_speed
        end
      end
    end

    module ClassMethods
      # Overload the test_suites method so that we only return
      # valid test suites depending on if we're running speed
      # tests or not.
      def test_suites_with_speed
        results = test_suites_without_speed

        if ENV["SPEED"]
          results.select! { |r| r <= MiniTest::Speed::TestCase }
        else
          results.reject! { |r| r <= MiniTest::Speed::TestCase }
        end

        return results
      end
    end
  end
end

# Force MiniTest TestCase to include the marking framework.
MiniTest::Unit::TestCase.send(:include, MiniTest::SpeedHacks)
