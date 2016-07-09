require 'pry'
def test(plain_text, keyword)
  hash = (('a'..'z').map.with_index.to_a).to_h

# Get plaintext / key and delete all spaces
  joined_text = plain_text.split("").reject { |e| e.to_s == " " }
  joined_key = keyword.split("").reject { |e| e.to_s == " " }

  # def iterate_key(key)
  #   if key.length < text.length
  #     (text.length / key.length).times(key)
  #     .shift(text.length % key.length)
  # end

# Convert array of text into array of integers
  

  int_converted_text = []
# iterate through plain text
  joined_text.select do |letter|
# iterate through hash
    hash.each do |key, value|
  # change each element to value of corresponding key
      int_converted_text.push(letter = value.to_i) if letter == key
    end
  end

  int_converted_key = []
  joined_key.select do |key_letter|
    hash.each do |key, value|
      int_converted_key.push(key_letter = value.to_i) if key_letter == key
    end
  end

# Encrypt the combination
  
    # Add plaintext and key together
  formula = [int_converted_text, int_converted_key].transpose.map {|x| x.reduce :+}
  formula.map! {|num| num % 26}


# Convert back the ints to letters
  converted = []
  formula.each do |num|
    hash.each do |key, value|
      converted.push(num = key) if num == value
    end
  end
puts converted
end

test("apples", "banana")
