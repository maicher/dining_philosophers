module DiningPhilosophers
  module V2
    class Table
      def initialize(num_seats)
        @chopsticks = Array.new(num_seats) { Chopstick.new }
      end

      def left_chopstick_at(position)
        index = (position - 1) % @chopsticks.size
        @chopsticks[index]
      end

      def right_chopstick_at(position)
        index = position % @chopsticks.size
        @chopsticks[index]
      end

      def chopsticks_in_use
        @chopsticks.select(&:in_use?).size
      end
    end
  end
end
