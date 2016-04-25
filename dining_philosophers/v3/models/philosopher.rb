module DiningPhilosophers
  module V3
    class Philosopher
      include Celluloid

      def initialize(name)
        @name = name
      end

      def dine(table, position, waiter)
        @waiter = waiter

        @left_chopstick  = table.left_chopstick_at(position)
        @right_chopstick = table.right_chopstick_at(position)

        think
      end

      def think
        puts "#{@name} is thinking."
        sleep(rand)

        # Asynchronously notifies the waiter object that
        # the philosophor is ready to eat

        @waiter.async.request_to_eat(Actor.current)
      end

      def eat
        take_chopsticks

        puts "#{@name} is eating."
        sleep(rand)

        drop_chopsticks

        # Asynchronously notifies the waiter
        # that the philosopher has finished eating

        @waiter.async.done_eating(Actor.current)

        think
      end

      def take_chopsticks
        @left_chopstick.take
        @right_chopstick.take
      end

      def drop_chopsticks
        @left_chopstick.drop
        @right_chopstick.drop
      end

      # This code is necessary in order for Celluloid to shut down cleanly
      def finalize
        drop_chopsticks
      end
    end
  end
end
