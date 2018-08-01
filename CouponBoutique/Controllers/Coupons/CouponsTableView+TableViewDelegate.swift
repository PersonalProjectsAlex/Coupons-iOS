//
//  CouponsTableView+TableViewDelegate.swift
//  CouponBoutique
//
//  Created by Mac on 26/7/18.
//  Copyright © 2018 Avalogics. All rights reserved.
//

import Foundation
import UIKit

extension CouponsTableView: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coupons.count > 0 ? self.coupons.count: 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Getting cell on cellforrowat
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.couponsCell, for: indexPath) as? CouponsCell else { return UITableViewCell() }
        
        if coupons.count > 0{
            cell.setAccounts = coupons[indexPath.row]
            cell.buttonWebView.tag = indexPath.row
            cell.buttonWebView.addTarget(self, action: #selector(self.yourButtonClicked(_:)), for: .touchUpInside)
        }
        
        return cell

    }
    
    @objc func yourButtonClicked(_ sender: UIButton?) {
       
            if coupons.count > 0{
                self.selectedCoupon = coupons[(sender?.tag)!]
            }
            
            self.performSegue(withIdentifier: "showDetails", sender: self)
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if coupons.count > 0{
//            self.selectedCoupon = coupons[indexPath.row]
//        }
//
//        self.performSegue(withIdentifier: "showDetails", sender: self)
//    }
    
    
    
    
}
