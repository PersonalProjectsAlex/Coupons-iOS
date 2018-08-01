//
//  CouponsCell.swift
//  CouponBoutique
//
//  Created by Mac on 26/7/18.
//  Copyright © 2018 Avalogics. All rights reserved.
//

import UIKit
import TagListView
import SDWebImage

class CouponsCell: UITableViewCell {

    
    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImageview: UIImageView!
    @IBOutlet weak var buttonWebView: UIButton!

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    var setAccounts: Coupon?{
        didSet {
            setupCell()
        }
    }

    func setupCell() {
        guard let accounts = setAccounts else {return}
        guard let imageURL = URL(string: accounts.image!) else{return}
        guard let title = accounts.name else{return}
        
        //tagListView.addTag("Hola")
        productImageview.sd_setImage(with:  imageURL, placeholderImage: #imageLiteral(resourceName: "couponsicon"))
        titleLabel.text = title
    }
    
    @IBAction func openWebView(_ sender: UIButton) {
        
    }
    
}
