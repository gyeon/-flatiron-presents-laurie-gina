class Nox
  # Assign index to alphabet as a key-value pair
  def alphabet_hash
    hash = (('A'..'Z').map.with_index.to_a).to_h
  end

  # Get plaintext / key and delete all spaces
  def joined(text)
    text.upcase.split("").reject { |e| e.to_s == " " }
  end

  def key_cycle(key)
    lengthened_key = []
    key.cycle do |k|
      lengthened_key << k
      break if lengthened_key.length == key.length
    end
    return lengthened_key
  end

  # Convert array of text into array of integers
  def convert_to_ints(text)
    int_text = text.joined
    numbers = []
    # iterate through plain text
    text.select do |letter|
      # iterate through hash
      hash.each do |key, value|
        # change each element to value of corresponding key
        numbers.push(letter = value.to_i) if letter == key
      end
    end
    int_text
  end

  # Encrypt the combination
  def encryption_formula(text, key)
    plain_text = text.convert_to_ints
    key_text = key.convert_to_ints
    # Add plaintext and key together
    combined = [plain_text, key_text].transpose.map {|num| num.reduce :+}
    combined.map! {|num| num % 26}
  end

  def decryption_formula(text, key)
    plain_text = text.convert_to_ints
    key_text = key.convert_to_ints
    # Add plaintext and key together
    combined = [plain_text, key_text].transpose.map {|num| num.reduce :-}
    combined.map! {|num| num % 26}
  end

  def output
  # Convert back the ints to letters
    ints = combined
    converted = []
    ints.each do |num|
      hash.each do |key, value|
        converted.push(num = key) if num == value
      end
    end
    converted
  end

end
