//
//  UserListRS.swift
//  New_Challenge
//
//  Created by Saad Saissi Hassani on 29/5/2023.
//

import Foundation


struct UserListRS : Codable {
    var userList : [User]
    
    enum CodingKeys: String, CodingKey {
        case userList = "data"
    }
}

struct User: Codable {
    var avatar      : String
    var id          : Int
    var firstName   : String
    var lastName    : String
    var email       : String
    
    enum CodingKeys: String, CodingKey {
        case avatar, id, email
        case firstName = "first_name"
        case lastName = "last_name"

    }
}
