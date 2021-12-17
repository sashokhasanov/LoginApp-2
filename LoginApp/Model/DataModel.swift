//
//  DataModel.swift
//  LoginApp
//
//  Created by Сашок on 17.12.2021.
//

import Foundation

struct Account {
    let login: String
    let password: String
    let person: Person
    
    static func createAccount() -> Account {
        Account(login: "User",
                password: "123",
                person: Person(personInfo: PersonInfo(name: "Aleksandr",
                                                      age: 30,
                                                      city: "Moscow"),

                               higherEducation: HigherEducation(university: "Moscow Institute of Physics and Technology",
                                                                beginYear: 2009,
                                                                endYear: 2015,
                                                                degree: "Master of Science"),
                               
                               job: Job(position: "C++ developer",
                                        company: "1C",
                                        yearsOfExperience: 8,
                                        description: "I help building business accounting software")))
    }
}

struct Person {
    let personInfo: PersonInfo
    let higherEducation: HigherEducation?
    let job: Job?
}

struct PersonInfo {
    let name: String
    let age: UInt
    let city: String
}

struct HigherEducation {
    let university: String
    let beginYear: UInt
    let endYear: UInt
    let degree: String
}

struct Job {
    let position: String
    let company: String
    let yearsOfExperience: UInt
    let description: String
}
