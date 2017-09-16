//
//  NetworkController.swift
//  MVCJaiHo
//
//  Created by appinventiv on 15/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//
import Foundation
import SwiftyJSON

//=============================================================//
//MARK: NetworkController Class
//=============================================================//

class NetworkController {
    
    var obPerson: Person!
    
//=============================================================//
//MARK: get() method which helps to hit url
//=============================================================//
    
    func get(url:String,userName:String,password:String,completion: @escaping (Person) -> ()) {
        
        /* // Cannot use this: No Clue why i cant use below request method of Alamofire with all such parameters
         
         let parameters: Parameters = [
         "foo": "bar",
         "baz": ["a", 1],
         "qux": [
         "x": 1,
         "y": 2,
         "z": 3
         ]
         ]
         
         // All three of these calls are equivalent
         Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters)
         Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: URLEncoding.default)
         Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: URLEncoding.httpBody)

     */
        
        // Defining Headers
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            "postman-token": "556e0e49-010c-2215-df7e-5baec12655b0"
        ]
        
        // Defining Body of the url
        let postData = NSMutableData(data: "UserName=\(userName)".data(using: String.Encoding.utf8)!)
        postData.append("&Password=\(password)".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        // Request is sent as URL and response is recieved
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let err = error {
                print(err)
            }
            else {
                
                // Data parsed using SwiftyJSON
                let json = JSON(data!)
                self.obPerson = Person(json: json)

            }
        })
        
        dataTask.resume()
        
        // Closure is executed after some delay
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
            completion(self.obPerson)
        })
        
    }


}
