//
//  newPostViewController.swift
//  SocialAppWithFirebase
//
//  Created by Mairaj khoso on 9/13/18.
//  Copyright © 2018 Mairaj khoso. All rights reserved.
//

import UIKit

class newPostViewController: UIViewController {

    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    
    
    var textViewPlaceHolderText = "What is in your mind"
//    [yourTextView setBackgroundColor:[UIColor clearColor]];
    var imagepicker: UIImagePickerController!
    var takenImage:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
        
        captionTextView.text = textViewPlaceHolderText
        captionTextView.textColor = .lightGray
        //captionTextView.delegate = self as! UITextViewDelegate
        
        
        //create an image picker
        imagepicker = UIImagePickerController()
        imagepicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            imagepicker.sourceType = .camera
            imagepicker.cameraCaptureMode = .photo
            
        }
        else
        {
            imagepicker.sourceType = .photoLibrary
            imagepicker.sourceType = .savedPhotosAlbum
        }
        self.present(imagepicker,animated: true,completion: nil)
        
        
        
    }

    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var shareButton: UIButton!
    
    
    
}


extension newPostViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //create our image
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.takenImage = image
        self.postImageView.image = self.takenImage
        self.dismiss(animated: true, completion: nil)
        
    }
    
    // selecting any wrong image and want to cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}















