
**JSON Web Encryption (JWE)**

A data structure representing an encrypted and integrity-protected message.

*Authenticated Encryption with Associated Data (AEAD)* :
An AEAD algorithm is one that encrypts the plaintext, allows Additional Authenticated Data to be specified, and provides an integrated content integrity check over the ciphertext and Additional Authenticated Data.  AEAD algorithms accept two inputs, the plaintext and the Additional Authenticated Data value, and produce two outputs, the ciphertext and the Authentication Tag value.  AES Galois/Counter Mode (GCM) is one such algorithm.

*Additional Authenticated Data (AAD)* :
An input to an AEAD operation that is integrity protected but not encrypted.

*Authentication Tag* :
An output of an AEAD operation that ensures the integrity of the ciphertext and the Additional Authenticated Data.  Note that some algorithms may not use an Authentication Tag, in which case this value is the empty octet sequence.

*Content Encryption Key (CEK)* :
A symmetric key for the AEAD algorithm used to encrypt the plaintext to produce the ciphertext and the Authentication Tag.

*JWE Encrypted Key* :
Encrypted Content Encryption Key value.  Note that for some algorithms, the JWE Encrypted Key value is specified as being the empty octet sequence.

*JWE Initialization Vector* :
Initialization Vector value used when encrypting the plaintext. Note that some algorithms may not use an Initialization Vector, in which case this value is the empty octet sequence.

*JWE AAD* :
Additional value to be integrity protected by the authenticated encryption operation.  This can only be present when using the JWE JSON Serialization.  (Note that this can also be achieved when using either the JWE Compact Serialization or the JWE JSON Serialization by including the AAD value as an integrity-protected Header Parameter value, but at the cost of the value being double base64url encoded.)

*JWE Ciphertext* :
Ciphertext value resulting from authenticated encryption of the
plaintext with Additional Authenticated Data.

*JWE Authentication Tag* :
Authentication Tag value resulting from authenticated encryption
of the plaintext with Additional Authenticated Data.

*JWE Protected Header* :
JSON object that contains the Header Parameters that are integrity protected by the authenticated encryption operation.  These parameters apply to all recipients of the JWE.  For the JWE Compact Serialization, this comprises the entire JOSE Header.  For the JWE JSON Serialization, this is one component of the JOSE Header.

*JWE Shared Unprotected Header* :
JSON object that contains the Header Parameters that apply to all recipients of the JWE that are not integrity protected.  This can only be present when using the JWE JSON Serialization.

*JWE Per-Recipient Unprotected Header* :
JSON object that contains Header Parameters that apply to a single recipient of the JWE.  These Header Parameter values are not integrity protected.  This can only be present when using the JWE JSON Serialization.

*JWE Compact Serialization* :
A representation of the JWE as a compact, URL-safe string.
