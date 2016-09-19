class Encrypt 

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


# test = Cipher.new("i love napping three times a day", "booyah")
# puts test.encrypt
# decrypt_test = Cipher.new("0@CT+;(DDG44;<FC+A0A9Q'1(M", "booyah")
# puts decrypt_test.decrypt
