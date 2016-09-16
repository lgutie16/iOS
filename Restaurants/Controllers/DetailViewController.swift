//
//  DetailViewController.swift
//  Restaurants
//
//  Created by admin on 3/09/16.
//  Copyright © 2016 eafit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = self.restaurant!.name
        self.detailsTextView.text = self.restaurant!.details
        self.addressLabel.text = self.restaurant!.address
        self.phoneLabel.text = self.restaurant!.phone
        self.categoryLabel.text = self.restaurant!.category
        self.rankingLabel.text = String(self.restaurant!.ranking)
        self.imageImageView.image = UIImage(named: self.restaurant!.image)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
