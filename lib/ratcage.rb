require 'generator/generator_factory'
require 'generator/rails_generator'

# API for the Ratcage gem
class Ratcage
  # dump method for init setup. Prints "Hello World" string
  # TODO: remove in production
  def say_hello
    "Hello World"
  end

  # method that accepts spec (configuration) object and returns template string
  def generate(spec_data)

  end
end