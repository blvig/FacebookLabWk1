//
//  ThrillistDetailViewController.swift
//  FacebookLabWk1
//
//  Created by Vig, Bonnie on 10/6/16.
//  Copyright © 2016 Vig, Bonnie. All rights reserved.
//

import UIKit

class ThrillistDetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var commentBar: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var postButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 375, height: 1203)
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
           
            UIView.animate(withDuration:0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.commentBar.frame.origin = CGPoint(x: 0, y: 411)
                
                self.commentField.frame.origin = CGPoint(x: 15, y: 406)
                
                self.postButton.frame.origin = CGPoint(x: 360, y: 406)

            })
            
            // Any code you put in here will be called when the keyboard is about to display
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
            print("Keyboard will hide")
        }
        
        scrollView.delegate = self
        

        commentField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: UIButton) {
        //user can turn like button on and off
        sender.isSelected = !sender.isSelected
    }

    @IBAction func didTapBackButton(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
        print("I'm scrolling!!!!!")
    }
    
    @IBAction func didTapPost(_ sender: AnyObject) {
     
        commentField.resignFirstResponder()
        
        UIView.animate(withDuration:0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.commentBar.frame.origin = CGPoint(x: 0, y: 550)
            
            self.commentField.frame.origin = CGPoint(x: 15, y: 550)
            
            self.postButton.frame.origin = CGPoint(x: 360, y: 550)
            
        })
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
