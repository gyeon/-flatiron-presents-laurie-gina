Encryption steps
    1. assign integers to letters
    2. get plain text
        a. delete all spaces
    3. get private key
        a. iterate private key according to the length of plain text and repeat if private key is shorter than plain text
    4. encrypt
        a. iterate through plain text and private key
        b. add first plain text integer with first private key integer
        c. mod with table size so that it wraps 
        d. then take that integer and convert back to corresponding letter
            i. cipher text

Decryption steps
    1. get cipher text
    2. get private key
    3. set to integers
    4. decrypt
        a. iterate through cipher text and private key
        b. subtract first cipher text integer with first private key integer
        c. mod with 26
        d. convert that back to the corresponding letter
    5. output plain text
