//
//  ViewController.swift
//  MemeMe v1
//
//  Created by Howard Snyder on 7/5/20.
//  Copyright © 2020 Howard Snyder. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImagePickerView: UIImageView!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    override func viewWillAppear(_ animated: Bool) {
        //is not running on simulator
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        }
    }

    @IBAction func pickAnImage(_ sender: Any) {
        print("Album button pressed")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
   
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    print("pic selected")
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
        ImagePickerView.image = image
    
    picker.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
}


