//
//  utilFunctions.swift
//  Moneyloc
//
//  Created by Tonte Owuso on 6/30/18.
//  Copyright © 2018 Qodehub. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

func navigateToPage(from:UIViewController,storyboardName:String,id:String) {
    
    let storyboard:UIStoryboard = UIStoryboard.init(name: storyboardName, bundle: nil)
    
    let mainTabBarController:UIViewController = storyboard.instantiateViewController(withIdentifier: id)
    from.present(mainTabBarController, animated: true, completion: nil)
}

func downloadImageFromUrl(url:String, imageView:UIImageView){
    if let imageUrl = URL(string: url){
        imageView.af_setImage(withURL: imageUrl)
    }
    
}
