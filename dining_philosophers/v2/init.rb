require_relative 'models/chopstick'
require_relative 'models/table'
require_relative 'models/philosopher'
require_relative 'models/waiter'

module DiningPhilosophers
  module V2
    module Init
      def run(names)
        philosophers = names.map { |name| Philosopher.new(name) }
        table = Table.new(philosophers.size)
        waiter = Waiter.new(philosophers.size - 1)

        threads = philosophers.map.with_index do |philosopher, i|
          Thread.new { philosopher.dine(table, i, waiter) }
        end

        threads.each(&:join)
        sleep
      end
    end
  end
end
