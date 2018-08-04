//
//  CreateVendorViewController.swift
//  Moneyloc
//
//  Created by Qodehub-intern on 04/08/2018.
//  Copyright © 2018 Qodehub. All rights reserved.
//

import UIKit
import FirebaseStorage
class CreateVendorViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
     var imagePicker:UIImagePickerController = UIImagePickerController()
     var selectedImage:UIImage?
    var uploadStatus = false
    var uploadUrl = ""
    
    @IBOutlet weak var vendorName: UITextField!
    
    @IBOutlet weak var vendorDescription: UITextField!
    
    @IBOutlet weak var vendorProvider: UITextField!
    
    @IBOutlet weak var vendorLocation: UITextField!
    @IBOutlet weak var selectImageButton: UIButton!
    
    
    @IBAction func AddNewButton(_ sender: Any) {
    }
    
    
    @IBAction func addImageButton(_ sender: Any) {
        let alert:UIAlertController = UIAlertController(title: "Choose where to upload the image from", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        // Add the actions
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            self .present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alertWarning = UIAlertController(title: "Error", message: "Camera Unavailable", preferredStyle: .alert)
            alertWarning.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
            {
                UIAlertAction in
                alertWarning.dismiss(animated: true, completion: nil)
            })
            self.present(alertWarning,animated: true,completion: nil)
            
        }
    }
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: { () -> Void in
                        self.selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            self.selectImageButton.setTitle("Change selected image", for: .normal)
            self.uploadImage(onSuccess: {print(self.uploadUrl)}, onError: {print(self.uploadStatus)})
            })
                 
    }
    
    func uploadImage(onSuccess:(() -> Swift.Void)? = nil,onError:(() -> Swift.Void)? = nil){
        if let image = selectedImage{
            // Get a reference to the storage service using the default Firebase App
            let storage = Storage.storage()
            
            // Create a storage reference from our storage service
            let storageRef = storage.reference()
            let vendorsRef = storageRef.child("vendors")
            let fileName = UUID().uuidString + ".jpg"
            let spaceRef = vendorsRef.child(fileName)
            
            // Data in memory
            let data = UIImageJPEGRepresentation(image, 0.5)
            
            
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            // Upload the file to the path "images/rivers.jpg"
            let uploadTask = spaceRef.putData(data!, metadata: metadata) { (metadata, error) in
                guard let metadata = metadata else {
                    // Uh-oh, an error occurred!
                    return
                }
                
                // You can also access to download URL after upload.
                spaceRef.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        return
                    }
                    self.uploadUrl = downloadURL.absoluteString
                    
                }

            }
            uploadTask.observe(.failure) { snapshot in
                self.uploadStatus = false
                if onError != nil{
                   onError!()
                }
            }
            uploadTask.observe(.success) { snapshot in
               self.uploadStatus = true
                if onSuccess != nil{
                   onSuccess!()
                }
            }
            
        }
    }

}
