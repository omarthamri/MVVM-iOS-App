//
//  CustomItemTableViewCell.swift
//  MVVMProject
//
//  Created by MACBOOK PRO RETINA on 25/12/2018.
//  Copyright © 2018 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class CustomItemTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var phoneNameLbl: UILabel!
    @IBOutlet weak var phoneContactImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupDataFromModel(model: Model) {
        self.phoneNumberLbl.text = model.phoneContactNumber
        self.phoneNameLbl.text = model.phoneContactName
        phoneContactImg.layer.borderWidth = 1
        phoneContactImg.layer.masksToBounds = false
        phoneContactImg.layer.borderColor = UIColor.black.cgColor
        phoneContactImg.layer.cornerRadius = phoneContactImg.frame.height/2
        phoneContactImg.clipsToBounds = true
    }
    
}
