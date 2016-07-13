class Encrypt < ApplicationRecord

  def encrypt
    # Split string into array, and convert to ASCII
    @text = text.split("").map(&:ord)
    @key = key.split("").map(&:ord)
    # Take the first element in both arrays and add them together into one array
    combined = [@text, key_cycle].transpose.map {|num| num.inject :+}
    # Call #show_encrypted and pass in the combined array
    @cipher_text = show_encrypted(combined)
  end

  private

  def key_cycle
    lengthened_key = []
    # Go through each element in the key
    @key.cycle do |k|
      # Push each element into new array
      lengthened_key << k
      # Loop until key.length == text.length
      break if lengthened_key.length == @text.length
    end
    lengthened_key
  end

  def show_encrypted(combined)
    # Go through each element of the combined array
    # Modulate with the number of characters in ASCII table
    sum_of_arrays = combined.map {|num| num % 128 }
    # Convert each element back into characters
    sum_of_arrays.map(&:chr).join("")
  end
end
