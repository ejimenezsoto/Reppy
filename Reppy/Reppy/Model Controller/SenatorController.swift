//
//  SenatorController.swift
//  Reppy
//
//  Created by Enzo Jimenez-Soto on 10/22/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

class SenatorController {
    
    
    func fetchSenators(completion: @escaping (Result<[SenatorFetch], NetworkError>) -> Void) {
    
    // let urlString = "https://api.propublica.org/congress/v1/{congress}/{chamber}/members.json"
    let baseURL = URL(string: "https://api.propublica.org/congress/v1/116/senate/members.json")!
    var request = URLRequest(url: baseURL)
           request.httpMethod = HTTPMethod.get.rawValue
           request.setValue("RHGj6XMZpxd2MYs0n343f5FRBNoZ8q5qE8rZ6kYa", forHTTPHeaderField: "X-API-Key")
           

    URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) in
        self.parse(json: data!)
        
    }) .resume()
        
    }
        
        func parse(json: Data) {
            
            let decoder = JSONDecoder()
            do {
                
             let jsonSenators = try decoder.decode(SenatorFetch.self, from: json)
               
                
                print(jsonSenators)
                
            } catch {
                print(error)
            }
        }
    

        
}
    
    
    

