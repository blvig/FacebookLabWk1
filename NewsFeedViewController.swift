//
//  NewsFeedViewController.swift
//  FacebookLabWk1
//
//  Created by Vig, Bonnie on 10/6/16.
//  Copyright © 2016 Vig, Bonnie. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var homeFeedImageView: UIImageView!
    
    var refreshControl = UIRefreshControl()
    func onRefresh () {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 375, height:  1203)

        
        // Do any additional setup after loading the view.
    }
    
    //right before the ViewController "appears"
    override func viewWillAppear(_ animated: Bool) {
        //hide feed ImageView
        homeFeedImageView.isHidden = true
        //turn on the activity indicator
        activityIndicator.startAnimating ()
    }
    
    
    //the moment the ViewController "appears"
    override func viewDidAppear(_ animated: Bool) {
        delay(2) { () -> () in
            //show the feed ImageView
            self.homeFeedImageView.isHidden = false
            //stop the activity indicator
            self.activityIndicator.stopAnimating()
        }
    //refresh UI view when loading 
        self.refreshControl = UIRefreshControl ()
        self.refreshControl.addTarget(self, action: #selector(onRefresh),for: .valueChanged)
        self.scrollView.insertSubview(refreshControl, at: 0)
        //turn on the activity indicator
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
