//
//  SecondViewController.swift
//  todo2020
//
//  Created by Muhammed Essa on 1/18/20.
//  Copyright © 2020 Muhammed Essa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textEdit: UITextField!
    
    @IBAction func saveBtn(_ sender: Any) {
        let itemsToSave = UserDefaults.standard.object(forKey: "items")
        
        var tiems:[String]
        if let tempItem = itemsToSave as? [String] {
            tiems = tempItem
            tiems.append( textEdit.text!  )
        }else{
               tiems = [ textEdit.text! ]
        }
        UserDefaults.standard.set(tiems, forKey: "items")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

