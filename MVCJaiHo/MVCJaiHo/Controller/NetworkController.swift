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
    
    func get(url:String,userName:String,password:String,completion: @escaping (JSON) -> ()) {
        
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
//        Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>).responseJSON { (response) in
//
//            if let result = response.result {
//
//
//            }
//        }
        
//        Alamofire.request(url: url, method: HTTPMethod.post, parameters: [userName,password], encoding: URLEncoding.default).responseJSON { (response) in
//
//        }

        
//        Alamofire.request(url, method: .post, parameters: [userName,password], encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//            
//        }
        
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
                
                // Completion Closure called when the value is fetched successfully
                completion(json)
            }
        })
        
        dataTask.resume()
        
    }


}
