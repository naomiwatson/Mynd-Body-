//
//  AddViewController.swift
//  MyndBody2
//
//  Created by Naomi Watson on 7/18/19.
//  Copyright © 2019 Naomi Watson. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    var previousVC = TodaysKindnessTableViewController()
    

    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let kindAct = AddKindActCD(entity: AddKindActCD.entity(), insertInto: context)
            
            if let titleText = titleTextField.text {
                
                kindAct.name = titleText
            
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
        
    
        
//        if let titleText = titleTextField.text {
//            kindAct.name = titleText
//
//
//        }
//        previousVC..append(kindAct)
//        previousVC.tableView.reloadData()
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

}
