require 'pry'
require_relative 'dining_philosophers'

class NoVersionError < StandardError; end

begin
  v = ARGV.first or raise NoVersionError
  include Kernel.const_get "DiningPhilosophers::#{v.upcase}::Init"

  names = %w(Heraclitus Aristotle Epictetus Schopenhauer Popper)
  run(names)

rescue NoVersionError
  print "Please specify a version number as a parameter.\n"
rescue NameError
  print "Such version is not available. Choose between v1..v4\n"
end
