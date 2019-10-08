//
//  ViewController.swift
//  杨泽宇作业二
//
//  Created by Apple on 2019/9/24.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var login_label: UILabel!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    @IBAction func Login(_ sender: Any) {
        if let userName = idField.text {
            label2.text = "welcome"
            label1.text = "you"
            label3.text = userName
        }
        if ((idField.text == "scut")&&(pwField.text=="123")){
            login_label.text = "login success"
        } else {
            login_label.text = "login fail"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

