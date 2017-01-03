//
//  ViewController.swift
//  spec-viewer
//
//  Created by Ezaan Mangalji on 2016-12-08.
//  Copyright © 2016 Ezaan Mangalji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var videoURL: NSURL?
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func photoLibraryAction(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = ["public.movie"]
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        videoURL = info["UIImagePickerControllerReferenceURL"] as? NSURL
        print(videoURL)
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
}

