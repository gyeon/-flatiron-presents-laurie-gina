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
      int_converted_key.push(letter = value.to_i) if letter == key
    end
  end

# Encrypt the combination
  
    # Add plaintext and key together
  added_ints = []
  formula = nil
  int_converted_text.each do |plain_letter|
    int_converted_key.each do |key|
      # Execute algebraic formula
      formula = (plain_letter + key) % 26
      added_ints << formula
    end
  end

# Convert back the ints to letters
  #   converted = []
  #   added_ints.each do |num|
  #     hash.each do |key, value|
  #       converted.push(num = key) if num == value
  #     end
  #   end
  # end

end
