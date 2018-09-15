//
//  post.swift
//  SocialAppWithFirebase
//
//  Created by Mairaj khoso on 9/14/18.
//  Copyright © 2018 Mairaj khoso. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class Post{
    
    var caption:String!
    var imagedownloadurl:String!
    private var image : UIImage
    
    init(image:UIImage, caption:String)
    {
        self.caption = caption
        self.image = image
    }
    
    init(snapshot:DataSnapshot){
        let json = JSON(snapshot.value ?? "")
        self.caption = json[
        "caption"].stringValue
        self.imagedownloadurl = json["imagedownloadurl"].stringValue
    }
    func save()
    {
        let newPostRef = Database.database().reference().child("posts").childByAutoId()
        let newPostKey = newPostRef.key
        
        if let imageData = UIImageJPEGRepresentation(self.image, 0.6){
            let imageStorageRef = Storage.storage().reference().child("images")
            let newimageRef = imageStorageRef.child(newPostKey)
            
            newimageRef.putData(imageData).observe(.success, handler: {(snapshot) in
                
                self.imagedownloadurl = snapshot.metadata.
                
                
            })
        }
    }
    
}
