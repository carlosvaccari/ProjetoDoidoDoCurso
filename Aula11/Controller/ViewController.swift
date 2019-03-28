//
//  ViewController.swift
//  Aula11
//
//  Created by Virtual Machine on 28/03/19.
//  Copyright © 2019 Virtual Machine. All rights reserved.
///Users/virtualmachine/Documents/Aula11/Aula11/ViewController.swift

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UserDefaultsDatabase.shared.currentUser = [Key.currentUser: "Carlos"]
        UserDefaultsDatabase.shared.isLogged = [Key.isLogged : true]
        print(userDefaults.currentUser)
    }

}

