**JSON Web Encryption (JWE)** represents encrypted content using JSON- based data structures [RFC7159].  

JWE represents encrypted content using JSON data structures and base64url encoding.  These JSON data structures MAY contain whitespace and/or line breaks before or after any JSON values or structural characters

A JWE represents these logical values (each of which is defined in JOSE_ReadMe):
* JOSE Header
* JWE Encrypted Key
* JWE Initialization Vector
* JWE AAD
* JWE Ciphertext
* JWE Authentication Tag

*JWE Encrypted Key* : Encrypted Content Encryption Key value.  Note that for some algorithms, the JWE Encrypted Key value is specified as being the empty octet sequence.

*JWE Initialization Vector* : Initialization Vector value used when encrypting the plaintext. Note that some algorithms may not use an Initialization Vector, in which case this value is the empty octet sequence.

*JWE AAD* : Additional value to be integrity protected by the authenticated encryption operation.  This can only be present when using the JWE JSON Serialization.  (Note that this can also be achieved when using either the JWE Compact Serialization or the JWE JSON Serialization by including the AAD value as an integrity-protected Header Parameter value, but at the cost of the value being double base64url encoded.)

*JOSE Header members* are the union of the members of
these values (each of which is defined in Section 2):
* JWE Protected Header
* JWE Shared Unprotected Header
* JWE Per-Recipient Unprotected Header

*JWE Protected Header*:
JSON object that contains the Header Parameters that are integrity protected by the authenticated encryption operation.  These parameters apply to all recipients of the JWE.  For the JWE Compact Serialization, this comprises the entire JOSE Header.  For the JWE JSON Serialization, this is one component of the JOSE Header.

*JWE Shared Unprotected Header*:
JSON object that contains the Header Parameters that apply to all recipients of the JWE that are not integrity  protected.  This can only be present when using the JWE JSON Serialization.

*JWE Per-Recipient Unprotected Header*:
JSON object that contains Header Parameters that apply to a single recipient of the JWE.  These Header Parameter values are not integrity protected.  This can only be present when using the JWE JSON Serialization.
