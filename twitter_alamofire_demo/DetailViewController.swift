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
    @IBOutlet weak var favorButton: UIButton!
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var screenLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBAction func didTapRetweet(_ sender: Any) {
        
    }
    @IBAction func didTapLike(_ sender: Any) {
        
        if(post!.favorited!){
            APIManager.shared.unfavorite(post!) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                    self.post!.favorited = false
                    self.post!.favoriteCount!-=1
                    self.favorButton.setImage(UIImage(named: "favor-icon.png"), for: .normal)
                }
                
            }
            
        }
        else{
            APIManager.shared.favorite(post!) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                    self.post!.favorited = true
                    self.post!.favoriteCount!+=1
                    self.favorButton.setImage(UIImage(named: "favor-icon-red.png"), for: .normal)
                }
                
            }
            
        }
        
    }
    var post : Tweet? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if let post = post{
            tweetLabel.text = post.text
            let urlString = URL(string: post.user.imageURL)
            profileView.af_setImage(withURL: urlString!)
            screenLabel.text = post.user.screenName!
            userLabel.text = post.user.name
            if(post.favorited!){
                favorButton.setImage(UIImage(named: "favor-icon-red.png"), for: .normal)
            }
            else{
                favorButton.setImage(UIImage(named: "favor-icon.png"), for: .normal)
            }
            if(post.retweeted){
                retweetButton.setImage(UIImage(named: "retweet-icon-green.png"), for: .normal)
            }
            else{
                retweetButton.setImage(UIImage(named: "retweet-icon.png"), for: .normal)
            }
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
