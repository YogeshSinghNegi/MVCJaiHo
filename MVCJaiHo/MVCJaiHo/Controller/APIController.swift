//
//  APIController.swift
//  MVCJaiHo
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//

import Foundation
import SwiftyJSON

//=============================================================//
//MARK: APIController Class
//=============================================================//

class APIController {
    
    var obPerson:Person!
    
//=============================================================//
//MARK: logInWith() method uses the login URL
//=============================================================//
    
    func logInWith(userName:String,password:String,completion: @escaping (Person) -> ()) {
        
        let obNC = NetworkController()
        let url = "https://httpbin.org/post"
        
        // Calling the get() method of NetworkController class with escaping closure
        obNC.get(url: url, userName: userName, password: password, completion: {(json:JSON) -> () in
            self.obPerson = Person(json: json)
            
            // Completion Closure called when the value is fetched successfully
            completion(self.obPerson)
        })
        
    }
    
}
