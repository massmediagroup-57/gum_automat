# frozen_string_literal: true

class Automat

  attr_accessor :coin, :gums

  def initialize
    @coin = false
    @gums = 0
  end

  # TODO: different coins
  def input_coin
    raise 'Coin is already there' if @coin

    @coin = true
  end

  def pull_handle
    raise 'Coin is not inserted' unless @coin
    raise 'Sorry out of gums' if @gums.zero?

    @coin = false
    @gums - 1
  end

  # TODO: limit gums
  def upload_gums(input)
    @gums = input.chomp.to_i
  end
end
