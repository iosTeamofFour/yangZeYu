//
//  food.swift
//  Homework3
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class food: NSObject, NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "nameKey")
        aCoder.encode(descrption,  forKey: "descriptionKey")
        aCoder.encode(category, forKey: "categoryKey")
        aCoder.encode(foodAvatar, forKey: "foodAvatarKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "nameKey") as? String
        descrption = aDecoder.decodeObject(forKey: "descriptionKey") as? String
        category = aDecoder.decodeObject(forKey: "categoryKey") as? String
        foodAvatar = aDecoder.decodeObject(forKey: "foodAvatarKey") as? UIImage
    }
    
    var name: String?
    var descrption: String?
    var category: String?
    var foodAvatar: UIImage?
    
    //add document path
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
 
    init(name: String?, description: String?, category: String?, foodAvatar: UIImage?) {
        self.name = name
        self.descrption = description
        self.category = category
        self.foodAvatar = foodAvatar
    }

}
