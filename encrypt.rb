# add first plain text integer with first private key integer
# 3. get private key
#     a. iterate private key according to the length of plain text and repeat if private key is shorter than plain text
# 4. encrypt
#     a. iterate through plain text and private key
#     b. add first plain text integer with first private key integer
#     c. mod with 26 so that it wraps if greater than 26
#     d. then take that integer and convert back to corresponding letter
#         i. cipher text

# Assign index to alphabet as a key-value pair
def alphabet_hash
hash = (('a'..'z').map.with_index.to_a).to_h
end

# Get plaintext / key and delete all spaces
def joined(text)
text.split("").reject { |e| e.to_s == " " }
end

def iterate_key(key)
if key.length < text.length
  (text.length / key.length).times(key)
  .shift(text.length % key.length)
end

# Convert array of text into array of integers
def convert_to_ints(text)
text.joined
numbers = []
# iterate through plain text
text.select do |letter|
  # iterate through hash
  hash.each do |key, value|
    # change each element to value of corresponding key
    numbers.push(letter = value.to_i) if letter == key
  end
end
end

# Encrypt the combination
def encrypt(text, key)
plain_text = text.convert_to_ints
key_text = key.convert_to_ints

# Add plaintext and key together
added_ints = []
formula = nil
plain_text.each do |plain_letter|
  key_text.each do |key|
    # Execute algebraic formula
    formula = (plain_letter + key) % 26)
    added_ints << formula
  end
end

# Convert back the ints to letters
converted = []
added_ints.each do |num|
  hash.each do |key, value|
    converted.push(num = key) if num == value
  end
end

end
