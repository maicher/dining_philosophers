require_relative 'models/chopstick'
require_relative 'models/table'
require_relative 'models/philosopher'

module DiningPhilosophers
  module V1
    module Init
      def run(names)
        philosophers = names.map { |name| Philosopher.new(name) }
        table = Table.new(philosophers.size)

        threads = philosophers.map.with_index do |philosopher, i|
          Thread.new { philosopher.dine(table, i) }
        end

        threads.each(&:join)
        sleep
      end
    end
  end
end
