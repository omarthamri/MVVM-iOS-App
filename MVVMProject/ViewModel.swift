//
//  ViewModel.swift
//  MVVMProject
//
//  Created by MACBOOK PRO RETINA on 25/12/2018.
//  Copyright © 2018 MACBOOK PRO RETINA. All rights reserved.
//

import Foundation

protocol ViewModelDelegate {
    func onItemAddClick(phoneName: String,phoneNumber: String)
}

protocol reloadTableViewDelegate {
    func reloadTableView(index: Int)
}

class ViewModel {
    
    var items = [Model]()
    var reloadDelegate: reloadTableViewDelegate?
    var itemJson = [["phoneContactNumber":"71111111","phoneContactName":"Omar Thamri"],
                    ["phoneContactNumber":"72222222","phoneContactName":"Bill Gates"],
                    ["phoneContactNumber":"73333333","phoneContactName":"Jeff Bezos"]]
    
    init(viewDelegate: reloadTableViewDelegate) {
        reloadDelegate = viewDelegate
        self.items = Model.modelFromDictionnaryArray(array: itemJson as! NSArray)
        print("items count",items.count)
    }
    
}

extension ViewModel: ViewModelDelegate {
    func onItemAddClick(phoneName: String,phoneNumber: String) {
        items.append(Model(phoneContactNumber: phoneNumber, phoneContactName: phoneName))
        reloadDelegate?.reloadTableView(index: items.count)
    }
    
    
}
