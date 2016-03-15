/*
HomeWork №1:
Creation of protocol, enums, structures and using of arrays of structures.
*/


enum BestUniversities: String {
    case MIPT, MSU, MEPHI
}

//  FIXME: the task was to use second enum with associated type feature
/* Fixed */
enum Place: CustomStringConvertible {
    case University(BestUniversities)
    case School(Int)
    
    var description: String {
        switch self {
        case .University(let bestUniversities):
            return bestUniversities.rawValue
        case .School(let numberOfSchool):
            return "school №" + "\(numberOfSchool)"
        }
    }
}

enum Status: String {
    case enrollee, bachelor, master, student, schoolboy
}

protocol Educable {
    //  FIXME: it is nice, but I would prefer to have not optional enum here with Place { School, Univercity(BestUniversities) }
    /* Fixed, enum Place was added. */
    var nameOfSchoolAndUniversity: Place { get set }
    //  FIXME: this should not be optional too cause schoolboy can complete the school
    /* Fixed, in initialization for schoolboys */
    var yearIncome: Int { get set }
    var yearEnd: Int { get set }
    var status: Status { get set }
    var department: String? { get set }
}

struct VerySmartGuy: Educable, CustomStringConvertible {
    //  FIXME: avoid using capital letters in first character in properties
    /* Fixed. */
    let name: String
    let birthDate: Int
    var nameOfSchoolAndUniversity: Place
    var yearIncome: Int
    var yearEnd: Int
    var status: Status
    var department: String?
    
    var description: String {
        if status == .schoolboy {
            return (name + " is studying at " + "\(nameOfSchoolAndUniversity)")
        }
        else {
            return (name + " is " + status.rawValue + " of " + "\(nameOfSchoolAndUniversity)" + " " + department!)
        }
    }
    
    //Initialization for schoolboys
    init(nameOfSchoolBoy name: String, BirthDate birthDate: Int, numberOfScool: Int) {
        self.name = name
        self.status = .schoolboy
        self.birthDate = birthDate
        self.yearEnd = birthDate + 6 + 11 // If age income to school is 6
        self.yearIncome = birthDate + 6
        self.nameOfSchoolAndUniversity = Place.School(numberOfScool)
    }
    
    //Inititalization for students or enrollees
    //    extra spaces
    init(name: String , birthDate: Int,  nameOfSchoolAndUniversity: BestUniversities,   yearIncome: Int,  yearEnd: Int,  status: Status,  department: String) {
        self.name = name
        self.birthDate = birthDate
        self.nameOfSchoolAndUniversity = Place.University(nameOfSchoolAndUniversity)
        self.yearIncome = yearIncome
        self.yearEnd = yearEnd
        self.status = status
        self.department = department
    }
    
}

struct GroupOfGuys: CustomStringConvertible {
    //    FIXME: make it a computed property with result guys.count
    /* Fixed */
    var number: Int {
        return guys.count
    }
    var guys: [VerySmartGuy]
    
    var description: String {
        var temp = ""
        for guy in guys {
            temp += (guy.description + "\n")
        }
        return temp
    }
    
    init() {
        self.guys = []
    }
    
    mutating func addGuyToGroup(nameOfGuy: VerySmartGuy) {
        guys.append(nameOfGuy)
    }
    
}

//Сreation of a group of guys
var myFriends = GroupOfGuys()
myFriends.addGuyToGroup(VerySmartGuy(name: "Denis", birthDate: 1996, nameOfSchoolAndUniversity: .MIPT, yearIncome: 2013, yearEnd: 2018, status: .student, department: "DREC"))
myFriends.addGuyToGroup(VerySmartGuy(name: "Kostya", birthDate: 1996, nameOfSchoolAndUniversity: .MSU, yearIncome: 2013, yearEnd: 2018, status: .student, department: "CMC"))
myFriends.addGuyToGroup(VerySmartGuy(name: "Alex", birthDate: 1996, nameOfSchoolAndUniversity: .MEPHI, yearIncome: 2013, yearEnd: 2018, status: .student, department: "T department"))
myFriends.addGuyToGroup(VerySmartGuy(nameOfSchoolBoy: "Mark", BirthDate: 2001, numberOfScool: 6))
print (myFriends)








