//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    var tweet: Tweet! {
        didSet {
            
            tweetTextLabel.text = tweet.text
            timeLabel.text = tweet.createdAtString
            let userString = tweet.user.screenName
            screenNameLabel.text = userString
            userNameLabel.text = tweet.user.name
            let retweetString = "\(String(describing :tweet.retweetCount))"
            retweetLabel.text = retweetString
            let favCount = "\(String(describing: tweet.favoriteCount!))"
            favoriteLabel.text = favCount
            let profileURL = URL(string: tweet.user.imageURL)
          
            profileView.af_setImage(withURL: profileURL!)
            if(tweet.favorited!){
               self.favoriteButton.setImage(UIImage(named: "favor-icon-red.png"), for: .normal)
            }
            else{
                    self.favoriteButton.setImage(UIImage(named: "favor-icon.png"), for: .normal)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func didTapLike(_ sender: Any) {
        if(tweet.favorited!){
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                                           print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                        self.tweet.favorited = false
                        self.tweet.favoriteCount!-=1
                        self.favoriteLabel.text = String(self.tweet.favoriteCount!)
                        self.favoriteButton.setImage(UIImage(named: "favor-icon.png"), for: .normal)
                    }
                
            }
 
        }
        else{
        APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
              
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
                self.tweet.favorited = true
                self.tweet.favoriteCount!+=1
                self.favoriteLabel.text = String(self.tweet.favoriteCount!)
                self.favoriteButton.setImage(UIImage(named: "favor-icon-red.png"), for: .normal)
            }
            
        }

        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
