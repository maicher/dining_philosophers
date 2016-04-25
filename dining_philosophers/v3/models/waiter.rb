module DiningPhilosophers
  module V3
    class Waiter
      include Celluloid

      def initialize
        @eating = []
      end

      def request_to_eat(philosopher)
        return if @eating.include?(philosopher)

        @eating << philosopher
        philosopher.async.eat
      end

      def done_eating(philosopher)
        @eating.delete(philosopher)
      end
    end
  end
end
