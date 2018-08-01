//
//  TabBarController.swift
//  CouponBoutique
//
//  Created by Administrador on 27/07/18.
//  Copyright © 2018 Avalogics. All rights reserved.
//

import UIKit
import HexColors

class TabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Creating custom sizes on tabbar
        guard let items = tabBar.items?.count else {return}
        let numberOfItems = CGFloat(items)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        
        //Setting the image with backgroun on tab sleected
        guard let selectedTabIcon = HexColor(Constants.Colors.selectedTabIcon) else{return}
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: selectedTabIcon, size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.zero)
        
        // remove default border
        tabBar.frame.size.width = self.view.frame.width + 4
        tabBar.frame.origin.x = -1
    }


}
