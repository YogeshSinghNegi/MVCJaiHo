//
//  Person.swift
//  MVCJaiHo
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//

import Foundation
import SwiftyJSON

//=============================================================//
//MARK: Person Class
//=============================================================//

class Person {
    
    let userName:String!
    let password:String!
    
//=============================================================//
//MARK: initializer which populates store properties of Model
//=============================================================//
    
    init(json:JSON) {
        
        self.userName = json["form"]["UserName"].string!
        self.password = json["form"]["Password"].string!
        
    }
    
    
}
