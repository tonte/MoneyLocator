//
//  Vendor.swift
//  Moneyloc
//
//  Created by Tonte Owuso on 7/14/18.
//  Copyright © 2018 Qodehub. All rights reserved.
//

import Foundation
class Vendor{
    var name:String = ""
    var type:String = ""
    var imageURL:String = ""
    var status:Bool = true
    var providers:[String] = []
    
    
    init(name:String,type:String,imageURL:String,status:Bool,providers:[String]) {
        self.name = name
        self.type = type
        self.imageURL = imageURL
        self.status = status
        self.providers = providers
    }
    
}
