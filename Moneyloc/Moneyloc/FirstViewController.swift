//
//  FirstViewController.swift
//  Moneyloc
//
//  Created by Tonte Owuso on 6/23/18.
//  Copyright © 2018 Qodehub. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var ref: DatabaseReference!
    var vendorList:[Vendor] = []
    @IBOutlet weak var vendorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("Vendors")
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            let values = snapshot.children.allObjects as? [DataSnapshot]
            
            for value in values!{
                let vendor = Vendor(responseObject:value.value as AnyObject)
                self.vendorList.append(vendor)
            }
            self.vendorsTableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
       
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
//        navigateToPage(from:self,storyboardName: "Main", id: "vendorDetails")
        let storyboard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let vendorDetailsViewController = (storyboard.instantiateViewController(withIdentifier: "vendorDetails") as? VendorDetailsViewController)!
        vendorDetailsViewController.selectedVendor = vendorList[index]
        
        self.present(vendorDetailsViewController, animated: true, completion: nil)
    }
    
    
    

}

