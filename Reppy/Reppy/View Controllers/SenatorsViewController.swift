//
//  SenatorsViewController.swift
//  Reppy
//
//  Created by Enzo Jimenez-Soto on 7/31/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class SenatorsViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var partyLabel: UILabel!
    
    
    @IBOutlet weak var stateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let urlString = "https://api.propublica.org/congress/v1/{congress}/{chamber}/members.json"
        let baseURL = URL(string: "https://api.propublica.org/congress/v1/116/senate/members.json")!
        var request = URLRequest(url: baseURL)
               request.httpMethod = HTTPMethod.get.rawValue
               request.setValue("RHGj6XMZpxd2MYs0n343f5FRBNoZ8q5qE8rZ6kYa", forHTTPHeaderField: "X-API-Key")
               

        URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) in
            
            self.parseCaSenators(json: data!)
            
        }) .resume()
            
    }
    
    func parseCaSenators(json: Data) {
        
        let decoder = JSONDecoder()
        do {
            
         let jsonSenators = try decoder.decode(SenatorFetch.self, from: json)
            
            let caSenators = jsonSenators.results.first?.members.filter {$0.state == "CA" }
            
            let kamala = caSenators?.filter {$0.stateRank == "junior"}
            
            
            print(kamala)
            
            DispatchQueue.main.async {
                self.firstNameLabel.text = kamala?.first?.firstName
                self.lastNameLabel.text = kamala?.first?.lastName
                self.genderLabel.text = kamala?.first?.gender
                self.partyLabel.text = kamala?.first?.party
                self.stateLabel.text = kamala?.first?.state
                
            }
            
        } catch {
            print(error)
        }
        
        
        
    }
    
    
}
