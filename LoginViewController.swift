//
//  LoginViewController.swift
//  FacebookLabWk1
//
//  Created by Vig, Bonnie on 10/12/16.
//  Copyright © 2016 Vig, Bonnie. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var fblogoImageView: UIImageView!
    @IBOutlet weak var fieldSuperview: UIView!
    @IBOutlet weak var labelSuperview: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var logoinitialY: CGFloat!
    var logooffset: CGFloat!
    var fieldinitialY: CGFloat!
    var fieldoffset: CGFloat!
    var labelinitialY: CGFloat!
    var labeloffset: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoinitialY = fblogoImageView.frame.origin.y
        logooffset = -10
        
        fieldinitialY = fieldSuperview.frame.origin.y
        fieldoffset = -60
        
        labelinitialY = labelSuperview.frame.origin.y
        labeloffset = -270
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            self.fblogoImageView.frame.origin.y = self.logoinitialY + self.logooffset
            self.fieldSuperview.frame.origin.y = self.fieldinitialY + self.fieldoffset
            self.labelSuperview.frame.origin.y = self.labelinitialY + self.labeloffset

            // Any code you put in here will be called when the keyboard is about to display
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            self.fblogoImageView.frame.origin.y = self.logoinitialY
            self.fieldSuperview.frame.origin.y = self.fieldinitialY
            self.labelSuperview.frame.origin.y = self.labelinitialY
            
            // Any code you put in here will be called when the keyboard is about to hide
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDismiss(_ sender: AnyObject) {
        view.endEditing(true)
    }

   
    @IBAction func didPressLogin(_ sender: AnyObject) {
        //start animating the activity indicator
        activityIndicator.startAnimating()
        //set the button state to "selected"
        loginButton.isSelected = true
        //if both the email and password fields match what we are looking for...
        
        
        if emailText.text == "bonnie.vig@gmail.com" && passwordText.text == "1234" {
            delay(2, closure: { () -> () in
                self.loginSegue()
            })
        } else {
            delay(2, closure: { () -> () in
                self.showAlert()
            })
        }
    }
    
    func loginSegue() {
        //stop animating the activity indicator
        self.activityIndicator.stopAnimating()
        //set the button state back to default, "not selected"
        self.loginButton.isSelected = false
        //perform the Segue to the next screen
        self.performSegue(withIdentifier: "correctLogin", sender: nil)
    }
    
    func showAlert() {
        //stop animating the activity indicator

        self.activityIndicator.stopAnimating()
        //set the button state back to default "not selected"
        self.loginButton.isSelected = false
        //create and show UIAlertController
        
        let alertController = UIAlertController(title: "Error", message: "User name and/or Password is not correct", preferredStyle: .alert)
        
        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        //create a condidtional statement: if the username or password fields are empty than...
        if emailText.text!.isEmpty || passwordText.text!.isEmpty {
            //set the button state to disabled
            loginButton.isEnabled = false
        } else {
            //set the button state to enabled
            loginButton.isEnabled = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
