//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Chanel Johnson on 7/6/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var screenLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    var post : Tweet? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if let post = post{
            tweetLabel.text = post.text
            let urlString = URL(string: post.user.imageURL)
            profileView.af_setImage(withURL: urlString!)
            screenLabel.text = post.user.screenName!
            userLabel.text = post.user.name
            
        }
        // Do any additional setup after loading the view.
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
