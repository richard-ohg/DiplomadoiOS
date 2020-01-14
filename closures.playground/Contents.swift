import UIKit



func repeatPrint(times: Int) -> (String) -> (){
    func printer(text: String){
        for _ in 1...times{
            print(text)
        }
    }
    return printer
}

var foo = repeatPrint(times: 5)

foo("String")

