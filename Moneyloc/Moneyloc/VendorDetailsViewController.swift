//
//  VendorDetailsViewController.swift
//  Moneyloc
//
//  Created by Tonte Owuso on 7/28/18.
//  Copyright © 2018 Qodehub. All rights reserved.
//

import UIKit

class VendorDetailsViewController: UIViewController {
    
    @IBOutlet weak var vendorImageView: UIImageView!
    @IBOutlet weak var vendorName: UILabel!
    @IBOutlet weak var vendorDescriptionLabel: UILabel!
    @IBOutlet weak var vendorOperatingTimesLabel: UILabel!
    @IBOutlet weak var vendorProvidersLabel: UILabel!
    @IBOutlet weak var vendorLocationLabel: UILabel!
    var selectedVendor:Vendor?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let vendor = selectedVendor{
            vendorName.text = vendor.name
            downloadImageFromUrl(url: vendor.imageURL, imageView: self.vendorImageView)
            vendorDescriptionLabel.text = vendor.description
            vendorOperatingTimesLabel.text = vendor.operatingTimes
            for provider in vendor.providers{
                vendorProvidersLabel.text = vendorProvidersLabel.text! + " ," + provider
            }
            vendorLocationLabel.text = vendor.location
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func vendorDirectionsButtonClicked(_ sender: Any) {
    }
    


}
