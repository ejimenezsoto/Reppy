//
//  SenatorController.swift
//  Reppy
//
//  Created by Enzo Jimenez-Soto on 10/22/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

class SenatorController {
    
    var senators: [Senator] = []
    
    private     // let urlString = "https://api.propublica.org/congress/v1/{congress}/{chamber}/members.json"
    let baseURL = URL(string: "https://api.propublica.org/congress/v1/116/senate/members.json")!
    
    
    func fetchSenators(completion: @escaping (Result<[SenatorFetch], NetworkError>) -> Void) {
    
    var request = URLRequest(url: baseURL)
           request.httpMethod = HTTPMethod.get.rawValue
           request.setValue("RHGj6XMZpxd2MYs0n343f5FRBNoZ8q5qE8rZ6kYa", forHTTPHeaderField: "X-API-Key")
           

    URLSession.shared.dataTask(with: request) { (data, response, error) in
       
        if let response = response {
            print(response)
        }
        
        if let error = error {
            print("Error decoding senators: \(error)")
            return
        }
        
        guard let data = data else {
            completion(.failure(.noData))
            return
        }
        
       
            do {
                
                let jsonSenators = try self.jsonDecoder.decode(SenatorFetch.self, from: data)
                let allSenators = jsonSenators.results.first?.members
                
                let californiaSenators = allSenators?.filter {$0.state == "CA"}
                
                
               
//                print(allSenators as Any)
//                print(californiaSenators as Any)
                self.senators.append(contentsOf: allSenators!)
                
            } catch {
                print("Error decoding Senators: \(error)")
                      completion(.failure(.badDecode))
            }
        
    }.resume()
        
    }
    
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(SenatorController.dateFormatter)
        return decoder
    }()
    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }
        
}
    
    
    

