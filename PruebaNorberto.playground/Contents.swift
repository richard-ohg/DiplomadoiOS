//import UIKit
//import CryptoKit
//
//var intHigh: Int64 = 0
//var intLow: Int64
//
////do{
////    try intHigh = intHigh.addingReportingOverflow(Int64.max).partialValue
////}catch {
//// print("do")
////}
//
////print(sequenceKey)
//
//extension String {
//
//  var length: Int {
//    return count
//  }
//
//  subscript (i: Int) -> String {
//    return self[i ..< i + 1]
//  }
//
//  subscript (r: Range<Int>) -> String {
//    let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
//                                        upper: min(length, max(0, r.upperBound))))
//    let start = index(startIndex, offsetBy: range.lowerBound)
//    let end = index(start, offsetBy: range.upperBound - range.lowerBound)
//    return String(self[start ..< end])
//  }
//
//}
//
//let dictionary: String = "!#%+23456789:=?@ABCDEFGHJKLMNPRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
//
//func generateSequenceKey() -> String{
//    var sequenceKey = ""
//
//    while sequenceKey.count < 64{
//        let number = Int.random(in: 0..<16)
//        sequenceKey += String(number, radix: 16)
//    }
//    return sequenceKey
//}
//
//let gen = generateSequenceKey()
//let gen2 = generateSequenceKey()
//let gen3 = generateSequenceKey()
//let gen4 = generateSequenceKey()
//
//
//dictionary[3]
//
//
//
//
////---------------------------------
//
//
//
//func encryptInteger(integer: UInt64, key: SymmetricKey) -> Data{
////    convert from Int to Data
//    let data = withUnsafeBytes(of: integer) {
//        Data($0)
//    }
////    Encrypt with AES from CryptoKit
//    let encryptedContent = try! AES.GCM.seal(data, using: key).combined
//    let sealedBox = try! AES.GCM.SealedBox(combined: encryptedContent!)
////    print(sealedBox.ciphertext)
//    return sealedBox.ciphertext
//}
//
//func convertDataToNumber(data: Data) -> UInt64{
//    let value = data.withUnsafeBytes {
//        $0.bindMemory(to: UInt64.self)[0]
//    }
//    return value
//}
//
//let key = SymmetricKey(size: .bits256)
//let alphabet = "abcde"
//let characterSetSize: UInt64 = UInt64(alphabet.count)
//let arrayAlphabet = Array(alphabet)
////print(arrayAlphabet[2])
//
//for x in 0...10{
//    let encryptData = encryptInteger(integer: UInt64(x), key: key)
//    let numberFromBits = convertDataToNumber(data: encryptData)
//    let remainderResult = numberFromBits%characterSetSize
//    print(remainderResult)
//
////    print(arrayAlphabet[3])
//}
//
//
//
//
////------------------------------
//var value = 2
//var counter = String(value, radix: 2)
//
//   while counter.count < 14 {
//       counter = "0" + counter
//   }
//
//Data(counter.utf8)
//
//
//
//
//
//

//-----------------------------

var array = [[String]]()

for x in 0..<3 {
    array.append([String(x)])
}

print(array)
array[0].removeAll()
print(array)
array.removeAll()
print(array)
