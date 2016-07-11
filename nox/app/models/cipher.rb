class Cipher < ApplicationRecord
  attr_accessor :text, :key
   START = "A".ord #65
   FINISH = "Z".ord #90

  def initialize(text, key)
    # 1. Convert string into array
    # 2. Remove empty space
    # 3. Convert each element in array into the ordinal ASCII numbers
    @text = text.split("").reject { |e| e.to_s == " " }.map(&:ord)
    @key = key.split("").reject { |e| e.to_s == " " }.map(&:ord)
  end

  def encrypt
    # Add plaintext and key together into one array
    combined = [text, key_cycle].transpose.map {|num| num.inject :+}
    # Call #show_encrypted and pass in the combined array
    show_encrypted(combined)
  end

  def decrypt
    # Add plaintext and key together into one array
    combined = [text, key_cycle].transpose.map {|num| num.inject :-}
    # Call #show_encrypted and pass in the combined array
    show_encrypted(combined)
  end

  private

  def key_cycle
    lengthened_key = []
    # Go through each element in the key
    key.cycle do |k|
      # Push each element into new array
      lengthened_key << k
      # Finish looping until key.length == text.length
      break if lengthened_key.length == text.length
    end
    lengthened_key
  end

  def show_encrypted(combined)
    # 1. Go through each element of the combined array
    # 2. num modulo sum of the start and end points of A-Z in ASCII table
    sum_of_arrays = combined.map {|num| num % (FINISH + START) }
    # Convert each element back into characters
    sum_of_arrays.map(&:chr).join("")
  end
end

# test = Cipher.new("i love napping three times a day", "booyah")
# puts test.encrypt
# decrypt_test = Cipher.new("0@CT+;(DDG44;<FC+A0A9Q'1(M", "booyah")
# puts decrypt_test.decrypt
