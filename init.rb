# frozen_string_literal: true

require './lib/automat_interface'
require 'readline'

automat_interface = AutomatInterface.new
while (input = Readline.readline('> '))
  automat_interface.command(input)
end
