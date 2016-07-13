class Encrypt < ApplicationRecord

  def encrypt
    @text = text.split("").map(&:ord)
    @key = key.split("").map(&:ord)
    combined = [@text, key_cycle].transpose.map {|num| num.inject :+}
    @cipher_text = show_encrypted(combined)
  end

  private

  def key_cycle
    lengthened_key = []
    @key.cycle do |k|
      lengthened_key << k
      break if lengthened_key.length == @text.length
    end
    lengthened_key
  end

  def show_encrypted(combined)
    sum_of_arrays = combined.map {|num| num % 128 }
    sum_of_arrays.map(&:chr).join("")
  end
end
