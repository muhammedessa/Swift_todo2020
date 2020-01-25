//
//  FirstViewController.swift
//  todo2020
//
//  Created by Muhammed Essa on 1/18/20.
//  Copyright © 2020 Muhammed Essa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var table: UITableView!
    
    
    var items:[String]  = []
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell( style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
//        var labeldcell = ""
//        if let cellLabel = items[ indexPath.row ] as? String{
//            labeldcell = cellLabel
//        }
        cell.textLabel?.text = items[ indexPath.row ]
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
           let itemsToSave = UserDefaults.standard.object(forKey: "items")
                if let tempItem = itemsToSave as? [String] {
                    items = tempItem
                }
        
        table.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            items.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set( items, forKey: "items")
        }
        
        
    }


}

