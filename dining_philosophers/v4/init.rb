require_relative 'lib/actor'
require_relative 'models/chopstick'
require_relative 'models/table'
require_relative 'models/philosopher'
require_relative 'models/waiter'

module DiningPhilosophers
  module V4
    module Init
      def run(names)
        philosophers = names.map { |name| Philosopher.new(name) }
        waiter = Waiter.new # no longer needs a "capacity" argument
        table = Table.new(philosophers.size)

        philosophers.each_with_index do |philosopher, i|
          # No longer manually create a thread, rely on async() to do that for us.
          philosopher.async.dine(table, i, waiter)
        end

        sleep
      end
    end
  end
end
