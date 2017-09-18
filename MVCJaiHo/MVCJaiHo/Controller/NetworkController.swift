//
//  NetworkController.swift
//  MVCJaiHo
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

//=============================================================//
//MARK: NetworkController Class
//=============================================================//

class NetworkController {
    
//=============================================================//
//MARK: get() method which helps to hit url
//=============================================================//
    
    func get(url:String,dataDictionary:[String:String],completion: @escaping (JSON) -> ()) {
        
        // Sending request using Alamofire 
        Alamofire.request(url, method: .post, parameters: dataDictionary, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let data = response.data {
            
                // Data parsed using SwiftyJSON
                let json = JSON(data)
                
                // Completion Closure called when the value is fetched successfully
                completion(json)
                
            }
            
        }
      
    }

}
