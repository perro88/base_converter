class ConvertersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
  @answer = decimal_to_binary(params[:Number].to_i, params[:Base].to_i)
  end
end

def decimal_to_binary(decimal, base = 2)
  arr = []
  until decimal.zero?
    number = decimal % base
    arr << number
    decimal /= base
  end
  arr.length.zero? ? "0" : arr.reverse.join
end
