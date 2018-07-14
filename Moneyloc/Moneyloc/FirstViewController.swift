//
//  FirstViewController.swift
//  Moneyloc
//
//  Created by Tonte Owuso on 6/23/18.
//  Copyright © 2018 Qodehub. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    
    let vendorList = [ Vendor.init(name: "By His Grace Ent", type: "Mobile Money", imageURL: "https://www.google.com.gh/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjxh4KLxJ7cAhXBkCwKHVIICvMQjRx6BAgBEAU&url=https%3A%2F%2Fstarrfmonline.com%2F2017%2F09%2F14%2Fsekondi-mobile-money-vendor-faints-over-ghc6k-scam%2F&psig=AOvVaw2EqLdhX2wnRHsYgi3ie03z&ust=1531655649276493", status: true, providers: ["MTN"]),Vendor.init(name: "By His Grace Ent 2", type: "Mobile Money", imageURL: "", status: true, providers: ["MTN"]),Vendor.init(name: "By His Grace Ent 3", type: "Mobile Money", imageURL: "", status: false, providers: ["MTN"])]
    
    
    
    
    
    let dataSource = ["Comfort","Ewurafua","Samuel","Ernest","Tonte"]
    @IBOutlet weak var vendorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return vendorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        let vendor = vendorList[index]
        var cellNib = Bundle.main.loadNibNamed("customTableViewCells", owner: nil, options: nil)
        let cell = cellNib![0] as? VendorTableViewCell
       
        
        cell?.setup(name: vendor.name, status: vendor.status, imageURL: vendor.imageURL, type: vendor.type)
        return cell!
    }

    
    
    

}

