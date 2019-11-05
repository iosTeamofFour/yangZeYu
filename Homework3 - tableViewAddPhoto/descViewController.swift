//
//  descViewController.swift
//  Homework3
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class descViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet weak var foodImage: UIImageView!
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func TapPhoto(_ sender: UITapGestureRecognizer) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
    }
    
    
    var foodForEdit: food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.text = foodForEdit?.name
        self.descField.text = foodForEdit?.descrption
        self.navigationItem.title = foodForEdit?.name
        self.categoryText.text = foodForEdit?.category
        self.foodImage.image = foodForEdit?.foodAvatar
        // Do any additional setup after loading the view.
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewClick))
        foodImage?.addGestureRecognizer(singleTapGesture)
        foodImage?.isUserInteractionEnabled = true
    }
    
    @objc func imageViewClick()
    {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info [UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.foodImage.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList" {
            print("save")
            foodForEdit = food(name: self.nameField.text, description: self.descField.text, category: self.categoryText.text, foodAvatar: self.foodImage.image)
        }
        if segue.identifier == "cancelToList" {
            print("cancel")
        }
    }
    

}
