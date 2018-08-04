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
    var longitude:String = ""
    var latitude:String = ""
    var location:String = ""
    var operatingTimes:String = ""
    var description:String = ""
    
    
    init(name:String,type:String,imageURL:String,status:Bool,providers:[String]) {
        self.name = name
        self.type = type
        self.imageURL = imageURL
        self.status = status
        self.providers = providers
    }
    
    init(responseObject:AnyObject?) {
        if let object = responseObject{
            if let name = object.value(forKey: "name") as? String{
                self.name = name
            }
            if let type = object.value(forKey: "type") as? String{
                self.type = type
            }
            if let imageURL = object.value(forKey: "imageURL") as? String{
                self.imageURL = imageURL
            }
            if let status = object.value(forKey: "status") as? Bool{
                self.status = status
            }
            if let providers = object.value(forKey: "providers") as? [String]{
                self.providers = providers
            }
            if let longitude = object.value(forKey: "longitude") as? String{
                self.longitude = longitude
            }
            if let latitude = object.value(forKey: "latitude") as? String{
                self.latitude = latitude
            }
            if let location = object.value(forKey: "location") as? String{
                self.location = location
            }
            if let operatingTimes = object.value(forKey: "operatingTimes") as? String{
                self.operatingTimes = operatingTimes
            }
            if let description = object.value(forKey: "description") as? String{
                self.description = description
            }
            
        }
    }
    
}
