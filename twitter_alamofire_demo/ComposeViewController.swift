//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Chanel Johnson on 7/5/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage
import RSKPlaceholderTextView
protocol ComposeViewControllerDelegate : class{
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {
   
    @IBOutlet weak var textFieldView: RSKPlaceholderTextView!
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
  
    @IBOutlet weak var profileViewImage: UIImageView!
weak var delegate: ComposeViewControllerDelegate?
    @IBAction func didTapPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: textFieldView.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
                
                
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewImage.af_setImage(withURL: URL(string:User.current!.imageURL)!)

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
