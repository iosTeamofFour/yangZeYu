//
//  descViewController.swift
//  Homework3
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class descViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    var foodForEdit: food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.text = foodForEdit?.name
        self.descField.text = foodForEdit?.descrption
        self.navigationItem.title = foodForEdit?.name
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList" {
            print("save")
            foodForEdit = food(name: self.nameField.text, description: self.descField.text)
        }
        if segue.identifier == "cancelToList" {
            print("cancel")
        }
    }
    

}
