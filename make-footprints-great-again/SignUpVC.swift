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
    @IBOutlet weak var addProfilePicButton: UIButton!
    
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
        if let name = nameField.text where name != "", let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { error, authData in
                if error != nil {
                    print(error)
                    if error.code == STATUS_ACCOUNT_NONEXIST {
                        DataService.ds.REF_BASE.createUser(email, password: pwd, withValueCompletionBlock: { error, result in
                            if error != nil{
                                self.showErrorAlert("Could not create account", msg: "Problem creating account. Try something else")
                            }else{
                                NSUserDefaults.standardUserDefaults().setValue(result[KEY_UID], forKey: KEY_UID)
                                
                                DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: nil)
                                self.performSegueWithIdentifier(SEGUE_SIGNED_IN, sender: nil)
                            }
                        })
                    }
                }
            })
        }else{
            showErrorAlert("Incomplete Fields", msg: "You must complete all fields to sign up")
        }
    }
    
    @IBAction func addPicPressed(sender: AnyObject) {
        addProfilePicButton.hidden = true
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
    
    //MARK :- Alert dialogue box popper
    func showErrorAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

    

}
