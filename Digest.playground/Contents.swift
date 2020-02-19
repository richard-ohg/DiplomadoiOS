import UIKit
import CryptoKit

let data = Data("password123".utf8)
let data2 = Data("password124".utf8)
let hash = SHA256.hash(data: data)

//Llaves simétricas
//SymetricKey es una representación particular de swift de la llave
let key = SymmetricKey(size: .bits256)

let authenticationCode = HMAC<SHA256>.authenticationCode(for: data, using: key)
print(authenticationCode)

let keyb64 = key.withUnsafeBytes {
    //Para poder transmitir la llave se hace un encoding a base 64 (Obtener los datos crudos de la llave)
    return Data(Array($0)).base64EncodedString()
}

let key2 = SymmetricKey(data: Data(base64Encoded: keyb64)!)

let authenticationCodeData = Data(authenticationCode)
if (HMAC<SHA256>.isValidAuthenticationCode(authenticationCodeData, authenticating: data, using: key2)) {
    print("Validating data.")
} else {
    print("Not validating data")
}



let encryptedContent = try! ChaChaPoly.seal(data2, using: key).combined
let sealedBox = try! ChaChaPoly.SealedBox(combined: encryptedContent)

let decryptedData = try! ChaChaPoly.open(sealedBox, using: key)

assert(decryptedData == data2)
