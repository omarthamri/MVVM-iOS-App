//
//  Model.swift
//  MVVMProject
//
//  Created by MACBOOK PRO RETINA on 25/12/2018.
//  Copyright © 2018 MACBOOK PRO RETINA. All rights reserved.
//

import Foundation

class Model {
    var phoneContactName: String?
    var phoneContactNumber: String?
    
    init(phoneContactNumber: String,phoneContactName: String) {
        self.phoneContactNumber = phoneContactNumber
        self.phoneContactName = phoneContactName
    }
    
    init(dictionnary: NSDictionary) {
        self.phoneContactNumber = dictionnary["phoneContactNumber"] as? String
        self.phoneContactName = dictionnary["phoneContactName"] as? String
    }
    
    public class func modelFromDictionnaryArray(array: NSArray) -> [Model] {
        var items = [Model]()
        for data in array {
            items.append(Model(dictionnary: data as! NSDictionary))
        }
        return items
    }
    
}
