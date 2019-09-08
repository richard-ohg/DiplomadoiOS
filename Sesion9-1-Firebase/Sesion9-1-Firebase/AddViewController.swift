//
//  AddViewController.swift
//  Sesion9-1-Firebase
//
//  Created by Ricardo Hernandez D4 on 9/6/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit
import Firebase
import MobileCoreServices
import FirebaseFirestore
import FirebaseStorage


class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var precio: UITextField!
    @IBOutlet weak var producto: UITextField!
    @IBOutlet weak var photo: UIImageView!
    
    var ref: DocumentReference!
    var getRef: Firestore!
    var optimizedImage: Data!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        
        //Looks for single or multiple taps.
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
//        view.addGestureRecognizer(tap)
        
        getRef = Firestore.firestore()
    }
    
//    @objc func dismissKeyboard() {
//        //Causes the view (or one of its embedded text fields) to resign the first responder status.
//        view.endEditing(true)
//    }
    
    @IBAction func agregar(_ sender: UIButton) {
        let datos: [String: Any] = ["nombre": producto.text!, "precio": precio.text!]
        ref = getRef.collection("productos").addDocument(data: datos, completion: { (error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("Se guardaron los datos")
            }
        })
        uploadImage(imageData: optimizedImage)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        let photoImage = UIImagePickerController()
        photoImage.sourceType = UIImagePickerController.SourceType.photoLibrary
        photoImage.mediaTypes = [kUTTypeImage as String]
        photoImage.delegate = self
        
        present(photoImage, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let optimizedImageData = imageSelected.jpegData(compressionQuality: 0.6){
            photo.image = imageSelected
            optimizedImage = optimizedImageData
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func uploadImage(imageData: Data){
        let activityIndicator = UIActivityIndicatorView.init(style: .gray)
        activityIndicator.startAnimating()
        activityIndicator.center = self.view.center
        view.addSubview(activityIndicator)
        
        let storageReference = Storage.storage().reference()
        let userImageRef = storageReference.child("/photos").child(ref.documentID)
        let uploadMetadata = StorageMetadata()
        
        uploadMetadata.contentType = "image/jpeg"
        
        userImageRef.putData(imageData, metadata: uploadMetadata) { (storageMetadata, error) in
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("metadata: ", storageMetadata?.path)
            }
        }
        
    }
    
}
