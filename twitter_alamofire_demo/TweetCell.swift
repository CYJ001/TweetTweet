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
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
