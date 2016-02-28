/* 
HomeWork №1:
  Creation of protocol, enums, structures and using of arrays of structures.
*/


enum BestUniversities: String {
  case MIPT, MSU, MEPHI
}

enum Status: String {
  case enrollee, bachelor, master, student, schoolboy
}

protocol Educable {
  var nameOfUniversity: BestUniversities? { get set }
  var receiptYear: Int? { get set }
  var dateOfCompletion: Int? { get set }
  var status: Status { get set }
  var department: String? { get set }
  
  func fullDescription() -> String
}

struct VerySmartGuy: Educable {
  var Name: String
  var birthDate: Int
  var nameOfUniversity: BestUniversities?
  var receiptYear: Int?
  var dateOfCompletion: Int?
  var status: Status
  var department: String?
  
  func fullDescription() -> String {
    if status == .schoolboy {
      return (Name + " is studying at school")
    }
    else {
      return (Name + " is " + status.rawValue + " of " + nameOfUniversity!.rawValue + " " + department!)
    }
  }
  
  //Initialization for schoolboys
  init(nameOfSchoolBoy Name: String, BirthDate birthDate: Int) {
    self.Name = Name
    self.status = .schoolboy
    self.birthDate = birthDate
  }
  
  //Inititalization for students or enrollees
  init(Name: String , birthDate: Int,  nameOfUniversity: BestUniversities,   receiptYear: Int,  dateOfCompletion: Int,  status: Status,  department: String) {
    self.Name = Name
    self.birthDate = birthDate
    self.nameOfUniversity = nameOfUniversity
    self.receiptYear = receiptYear
    self.dateOfCompletion = dateOfCompletion
    self.status = status
    self.department = department
  }
  
}

struct GroupOfGuys {
  var number: Int
  var guys: [VerySmartGuy] {
    didSet {
      number = guys.count
    }
  }
  
  func descriptionOfGroup() -> String {
    var description: String = ""
    for guy in guys {
      description += (guy.fullDescription()) + " \n"
    }
    return description
  }
  
  init() {
    self.number = 0
    self.guys = []
  }
  
  mutating func addGuyToGroup(nameOfGuy: VerySmartGuy) {
    guys.append(nameOfGuy)
  }
  
}

//Creation of guys
var Denis = VerySmartGuy(Name: "Denis", birthDate: 1996, nameOfUniversity: .MIPT, receiptYear: 2013, dateOfCompletion: 2018, status: .student, department: "DREC")
var Kostya = VerySmartGuy(Name: "Kostya", birthDate: 1996, nameOfUniversity: .MSU, receiptYear: 2013, dateOfCompletion: 2018, status: .student, department: "CMC")
var Alex = VerySmartGuy(Name: "Alex", birthDate: 1996, nameOfUniversity: .MEPHI, receiptYear: 2013, dateOfCompletion: 2018, status: .student, department: "T department")
var Mark = VerySmartGuy(nameOfSchoolBoy: "Mark", BirthDate: 2001)

//Сreation of a group of them
var myFriends = GroupOfGuys()

myFriends.addGuyToGroup(Denis)
myFriends.addGuyToGroup(Kostya)
myFriends.addGuyToGroup(Alex)
myFriends.addGuyToGroup(Mark)

print (myFriends.descriptionOfGroup())












