import Foundation

let asdf: AnyObject = Int(10)
asdf as! Int

protocol DictionaryCoding {
    init(dictionary: [String : AnyObject]) throws
    var dictionary: [String : AnyObject] { get }
}

// Person

struct Person: CustomStringConvertible {
    let firstName:  String
    let secondName: String
    let age:        Int
    
    init(firstName: String, secondName: String, age: Int) {
        self.firstName  = firstName
        self.secondName = secondName
        self.age        = age
    }
    
    var description: String {
        return firstName + " " + secondName + ", " + "\(age)" + " years"
    }
}

enum KeywordsErrors: ErrorType {
    case NoValueForKey(String)
}

extension Person: DictionaryCoding {
    init(dictionary: [String : AnyObject]) throws {
        if let firstNameValue = dictionary["firstName"] {
            self.firstName = firstNameValue as! String
        } else {
            throw KeywordsErrors.NoValueForKey("firstName")
        }
        
        if let secondNameValue = dictionary["secondName"] {
            self.secondName = secondNameValue as! String
            
        } else {
            throw KeywordsErrors.NoValueForKey("secondName")
        }
        
        if let ageValue = dictionary["age"] {
            self.age = ageValue as! Int
        } else {
            throw KeywordsErrors.NoValueForKey("age")
        }
    }
    
    var dictionary: [String : AnyObject] {
        let dict: [String : AnyObject] = ["firstName" : firstName, "secondName" : secondName, "age" : age]
        return dict
    }
}

let dictionaryOfPerson = ["firstName" : "Ilya", "secondName" : "Krotov", "age" : 20]
let Krotov: Person = try Person(dictionary: dictionaryOfPerson)

print("\(Krotov)")

