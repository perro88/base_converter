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

    arr.map do |number|
      hash.map do |key, value|
        if number == value
          number = key.to_s
          p number
        end
      end
    end
    p arr
    arr
  end
end
