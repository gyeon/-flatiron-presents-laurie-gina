Cryptography terminology

Cryptography - practice and study of hiding information
Cryptanalisis - discovering some weakness or insecurity in a cryptographic scene
Encryption - the method of transforming data (plaintext) into an unreadable format
Decryption - the method of turning cipher text back into plaintext
Plaintext - the (readable) format of data before being encrypted
Ciphertext - the "scrambled" format of data after being encrypted
Encryption algorithm - a set of rules or procedures that defines how to encrypt and decrypt data (also known as encryption cipher)
Key - value used in the encryption process to encrypt and decrypt

Substitution Cipher
  - Caesar cipher: shifting all the letters a certain number of space
  - ROT-13: rotates letters 13 spaces

Vigenere Table
  - Multi-alphabet substitution
  - Secret keyword only you and the other person knows
  - Line up the single-line phrase you wish to send and repeat the keyword underneath until it fills all the spaces
  - Take the spaces out
  - With a computer, you can brute force it. Brute-forcing means trying every possible combination. 26n-1. n being the number of letters in the keyword. Over 8 billion possible combinations with a 7-letter keyword.
  - More for friends passing a message.

Symmetric encryption
  - Uses the same key to encrypt and decrypt a piece of data
  - Strength depends on length of key

Asymmetric encryption
  - Two-key (public & private) system, where the one key is used for encryption and the other is used for decryption.
