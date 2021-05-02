class ConvertersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index; end

  def show
    @answer = decimal_to_binary(params[:Number].to_i, params[:Base].to_i)
  end

  def decimal_to_binary(decimal, base = 2)
    arr = []
    until decimal.zero?
      number = decimal % base
      arr << number
      decimal /= base
    end
    arr.length.zero? ? "0" : hash(arr).reverse.join
  end

  def hash(arr)
    hash = { A: 10, B: 11, C: 12, D: 13, E: 14, F: 15 }

    arr.each_with_index do |number, index|
      hash.each do |key, value|
        arr[index] = key.to_s if number == value
      end
    end
    arr
  end
end
