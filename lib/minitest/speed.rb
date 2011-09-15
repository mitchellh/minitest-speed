require "benchmark"
require "minitest/unit"

module MiniTest
  module Speed
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
