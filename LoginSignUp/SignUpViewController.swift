//
//  SignUpViewController.swift
//  LoginSignUp
//
//  Created by Arjun Neupane on 2019-12-04.
//  Copyright © 2019 Arjun Neupane. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    
    @IBOutlet weak var imagePicked: UIImageView!
    @IBOutlet weak var bio: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    @IBAction func signup(_ sender: Any) {
        if self.emailtextField.text == "" {
                             let alertController = UIAlertController(title: "Error", message: "Please enter email.", preferredStyle: .alert)
                             
                             let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                             alertController.addAction(defaultAction)
                             
                             present(alertController, animated: true, completion: nil)
        }
        
        else{
            
            if self.username.text == ""  {
                                 let alertController = UIAlertController(title: "Error", message: "username.", preferredStyle: .alert)
                                 
                                 let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                 alertController.addAction(defaultAction)
                                 
                                 present(alertController, animated: true, completion: nil)
            }
            else{
                if self.password.text == ""  {
                                     let alertController = UIAlertController(title: "Error", message: "Please enter password.", preferredStyle: .alert)
                                     
                                     let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                     alertController.addAction(defaultAction)
                                     
                                     present(alertController, animated: true, completion: nil)
                }
                else{
                    if self.bio.text == ""  {
                    let alertController = UIAlertController(title: "Error", message: "Please enter bio.", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    present(alertController, animated: true, completion: nil)
                }
                    
                else{
                     self.performSegue(withIdentifier: "profilescreen", sender: self);
                }
            }
        
            }
        }
    }
    // validate an email for the right format
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    func isValidPassword(testStr:String?)->Bool{
        guard testStr != nil else { return false }
     
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }
    
        
    
    @IBAction func openCameraButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            
//            self.ProfileViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Registration"

        // Do any additional setup after loading the view.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
