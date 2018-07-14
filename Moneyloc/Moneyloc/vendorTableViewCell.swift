//
//  vendorTableViewCell.swift
//  Moneyloc
//
//  Created by Tonte Owuso on 7/14/18.
//  Copyright © 2018 Qodehub. All rights reserved.
//

import UIKit

class VendorTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var vendorNameLabel: UILabel!
    @IBOutlet weak var vendorStatus: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    var name = ""
     var status = false
     var imageURL = ""
     var type = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(name:String,status:Bool,imageURL:String,type:String){
        self.vendorNameLabel.text = name
        self.typeLabel.text = type
        if (status){
             self.vendorStatus.text = "Open"
             self.vendorStatus.textColor = UIColor.green
        }
        else{
            self.vendorStatus.text = "Closed"
            self.vendorStatus.textColor = UIColor.red
        }
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
