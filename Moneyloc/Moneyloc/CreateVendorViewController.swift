//
//  CreateVendorViewController.swift
//  Moneyloc
//
//  Created by Qodehub-intern on 04/08/2018.
//  Copyright © 2018 Qodehub. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CreateVendorViewController: UIViewController {
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    
    
    
    
    @IBOutlet weak var vendorName: UITextField!
    
    @IBOutlet weak var vendorDescription: UITextField!
    
    @IBOutlet weak var vendorProvider: UITextField!
    
    @IBOutlet weak var vendorLocation: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBAction func AddNewButton(_ sender: Any) {
        
        if vendorName.text?.isEmpty == true || vendorLocation.text?.isEmpty == true || vendorProvider.text?.isEmpty == true || vendorDescription.text?.isEmpty == true {
            
            errorLabel.text = "All the fields are required"
        }
        
//        else {
//            let key = ref?.childByAutoId().key
//            
//            let vendorList = ["VendorId":key,
//                               "vendorname": vendorName.text! as String,
//                               "vendorlocation": vendorLocation.text! as String,
//                               "vendorprovider": vendorProvider.text! as String,
//                               "vendordescription":vendorDescription.text! as String ]
//            
//            
//            ref?.child(key!).setValue(vendorList)
//            
//        }
    }
    
    
    @IBAction func addImageButton(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
