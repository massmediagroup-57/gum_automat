# frozen_string_literal: true

require_relative 'automat'

class AutomatInterface
  POSSIBLE_COMMANDS = %w[insert_coin pull_handle upload_gums info].freeze

  attr_accessor :automat
  def initialize
    @automat = Automat.new
    command('info')
  end

  def command(input)
    return puts 'I don\'t understand what you are trying to do' unless POSSIBLE_COMMANDS.include?(input)

    puts send(input)
  rescue RuntimeError => e
    puts e
  end

  private

  def info
    [
      'Hello!',
      'We are glad that you have chosen our machine',
      "Available commands is: #{POSSIBLE_COMMANDS.join(', ')}"
    ].join("\n")
  end

  def insert_coin
    automat.input_coin
    'Coin successfully inserted, you could pull handle'
  end

  def pull_handle
    automat.pull_handle
    'Please, Take your gum'
  end

  def upload_gums
    puts 'How much gums you want to upload'
    input = Readline.readline('> ')
    "#{automat.upload_gums(input)} Gums uploaded"
  end
end
