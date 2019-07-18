//
//  TodaysKindnessTableViewController.swift
//  MyndBody2
//
//  Created by Naomi Watson on 7/18/19.
//  Copyright © 2019 Naomi Watson. All rights reserved.
//

import UIKit

class TodaysKindnessTableViewController: UITableViewController {
    

    var addKindAct : [AddKindActCD] = []
    
    func getKindAct() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataKindActs = try?context.fetch(AddKindActCD.fetchRequest()) as? [AddKindActCD] {
                addKindAct = coreDataKindActs
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return addKindAct.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let kindAct = addKindAct[indexPath.row]
        
        //iteration 2
        if let name = kindAct.name {
        
                cell.textLabel?.text = kindAct.name
            }
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getKindAct()
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddViewController {
            addVC.previousVC = self
        }
        
//        if let completeVC = segue.destination as? CompleteToDoViewController {
//            //   if let toDo = sender as? ToDo {
//            if let kindAct = sender as? AddKindActCD {
//                completeVC.selectedKindAct = kindAct
//                completeVC.previousVC = self
//            }
//        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let kindAct = addKindAct[indexPath.row]
//        
//p        erformSegue(withIdentifier: "moveToComplete", sender: kindAct)
//    }
}







