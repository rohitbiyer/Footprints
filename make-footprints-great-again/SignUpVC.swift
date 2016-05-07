//
//  SignUpVC.swift
//  make-footprints-great-again
//
//  Created by Rohit B Iyer on 5/7/16.
//  Copyright © 2016 Rohit Bhaskar. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var imageField: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let background = CAGradientLayer().orangeColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        imageField.layer.cornerRadius = imageField.frame.size.width / 2
        imageField.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        self.hideKeyboardWhenTappedAround()

    }

    @IBAction func onBackPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func signUpPressed(sender: UIButton) {
    }
    
    @IBAction func addPicPressed(sender: AnyObject) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageField.image = image
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

}
