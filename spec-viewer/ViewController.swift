//
//  ViewController.swift
//  spec-viewer
//
//  Created by Ezaan Mangalji on 2016-12-08.
//  Copyright © 2016 Ezaan Mangalji. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var videoURL: URL?
    let imagePicker = UIImagePickerController()
    
    var avPlayerLayer: AVPlayerLayer!
    let avPlayer = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
        if videoURL != nil {
            
            let playerItem = AVPlayerItem(url: videoURL!)
            avPlayer.replaceCurrentItem(with: playerItem)
            
            
            print("player set up")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func photoLibraryAction(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = ["public.movie"]
        
        print("OPENING picker")

        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Starting Playback")
        avPlayer.play() // Start the playback
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Layout subviews manually
        avPlayerLayer.frame = view.bounds
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        videoURL = info[UIImagePickerControllerMediaURL] as? URL
        print(videoURL!)
        
        print("CLOSING Picker")
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        viewDidLoad()
       
    }
    
    
}

