//
//  CreateVendorViewController.swift
//  Moneyloc
//
//  Created by Qodehub-intern on 04/08/2018.
//  Copyright © 2018 Qodehub. All rights reserved.
//

import UIKit

class CreateVendorViewController: UIViewController {

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
    
    @IBOutlet weak var vendorLocation: Create!
    
    @IBAction func AddNewButton(_ sender: Any) {
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
