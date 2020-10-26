//
//  SenatorViewController.swift
//  Reppy
//
//  Created by Enzo Jimenez-Soto on 10/26/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class SenatorViewController: UIViewController {
    
    
    var senators: [Senator] = []
    
    var senatorController = SenatorController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        senatorController.fetchSenators { (result) in
            
            
            
   
                
            }
        
        }
    
    
}

