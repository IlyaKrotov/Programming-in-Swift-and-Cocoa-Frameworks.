import Foundation
import Darwin

protocol RandomInstanceProtocol {
    static func randomInstance() -> Self
}

struct Animal: RandomInstanceProtocol {
    let nickName: String
    static func randomInstance() -> Animal {
        return Animal(nickName: "random nick name")
    }
}

extension RandomInstanceProtocol {
    static func randomArray(size: Int) -> [Self] {
        var arr = Array(count: size, repeatedValue: Self.randomInstance())
        for i in arr.indices {
            arr[i] = Self.randomInstance()
        }
        return arr
    }
}


/* The solution of the Task 2 */

extension Int: RandomInstanceProtocol {
    static func randomInstance() -> Int {
        return Int(arc4random())
    }
    
    static func randomInstanceFrom(from: Int, To to: Int) -> Int {
        return from + Int(arc4random_uniform(UInt32(to-from)))
    }
}

extension Float: RandomInstanceProtocol {
    static func randomInstance() -> Float {
        return Float(arc4random())/0xFFFFFFFF
    }
    
    static func randomInstanceFrom(from: Float, To to: Float) -> Float{
        return Float(arc4random())/0xFFFFFFFF*(to-from) + from
    }
}

extension Character: RandomInstanceProtocol {
    static func randomInstance() -> Character {
        return Character(UnicodeScalar(Int.randomInstanceFrom(1, To: 95)))
    }
}

extension String: RandomInstanceProtocol {
    static func randomInstance() -> String {
        var resultString = ""
        //It generate string with random length from 0 to 1024.
        for _ in 0...Int.randomInstanceFrom(0, To: 1024) {
            resultString.append(Character.randomInstance())
        }
        return resultString
    }
    
    static func randomInstanceWithLength(length: Int) -> String{
        var resultString = ""
        for _ in 0..<length {
            resultString.append(Character.randomInstance())
        }
        return resultString
    }
}


//Examples of using randomInstance()
let stringForExample: String = String.randomInstance()
let anotherStringForExample: String = String.randomInstanceWithLength(15)
let intForExample: Int = Int.randomInstance()
let anotherIntForExample: Int = Int.randomInstanceFrom(10, To: 20)
let floatForExample: Float = Float.randomInstance()
let anotherFloatForExample: Float = Float.randomInstanceFrom(10.0, To: 20.0)
let characterForExample: Character = Character.randomInstance()

struct AbsolutelyRandomStructure: CustomStringConvertible {
    let randomInt: Int
    let randomFloat: Float
    let randomCharacter: Character
    let randomString: String
    
    var description: String {
        return "Int: \(self.randomInt) \n Float: \(self.randomFloat) \n Character: \(self.randomCharacter) \n String:  \(self.randomString)"
    }
}

extension AbsolutelyRandomStructure: RandomInstanceProtocol {
    static func randomInstance() -> AbsolutelyRandomStructure {
        return AbsolutelyRandomStructure(randomInt: Int.randomInstance(), randomFloat: Float.randomInstance(), randomCharacter: Character.randomInstance(), randomString: String.randomInstance())
    }
}

let structureForExample: AbsolutelyRandomStructure = AbsolutelyRandomStructure.randomInstance()
print("\(structureForExample)")




