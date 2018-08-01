//
//  CouponsTableView.swift
//  CouponBoutique
//
//  Created by Mac on 26/7/18.
//  Copyright © 2018 Avalogics. All rights reserved.
//

import UIKit
import DropDown

class CouponsTableView: UIViewController{
    // MARK: - Let-Var
    var coupons = [Coupon]()
    var selectedCoupon:Coupon?
    let chooseDropDown = DropDown()
    let refresh = UIRefreshControl()
    // MARK: - Outlets
    @IBOutlet weak var couponsTableView: UITableView!
    @IBOutlet weak var categoriesDropdown: UIButton!
    
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        // setting up general actions/delegates/Core
        setUpActions()
        
        // setting up UI elements to be used through the code
        setUpUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        gettingData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       //showDetails
        if segue.identifier == "showDetails" {
            let detailController = segue.destination as! DetailAmazon
            detailController.selectedCoupon = selectedCoupon
            
        }
    }
    
    // MARK: - SetUps / Funcs
    func setUpUI(){}
    
    func setUpActions(){
        
        //Delegating tableview
        couponsTableView.delegate = self
        couponsTableView.dataSource = self
        
        //Set Cell Identifier
        Core.shared.registerCell(at: couponsTableView, named: Constants.CellIdentifiers.couponsCell)
        
        //Dropdown
        
        // The list of items to display. Can be changed dynamically
        chooseDropDown.dataSource = ["All Categories", "Baby Deals", "Free Stuffad "]
        chooseDropDown.anchorView = categoriesDropdown
        
        
        //Refresh control
        refresh.addTarget(self, action: #selector(setupData), for: .valueChanged)
        refresh.attributedTitle = NSAttributedString(string: "Uploading...")
        refresh.tintColor = .lightGray
        couponsTableView.refreshControl = refresh
    }
    
    @IBAction func showCategories(_ sender: UIButton) {
        chooseDropDown.show()
        weak var weakSelf = self
        guard let weak = weakSelf else{return}
        chooseDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            let indexValue = "\(item) "
            switch index {
            case 0:
                weak.categoriesDropdown.setTitle(indexValue, for: .normal)
            case 1:
                weak.categoriesDropdown.setTitle(indexValue, for: .normal)
            case 2:
                weak.categoriesDropdown.setTitle(indexValue, for: .normal)
            default:
                print("Error in selection")
            }
        }
    }
    
    private func gettingData(){
        weak var weakSelf = self
        guard let weak = weakSelf else{return}
        
        weak.refresh.endRefreshing()
        CouponsManager().getCoupons {
            response in
            guard let coupons = response else{
                print("Error")
                return
            }
            weak.coupons = coupons
            if weak.coupons.count > 0{
                weak.couponsTableView.reloadData()
            }
            print(coupons)
        }
        
    }
    
    // MARK: - Objective C
    @objc func setupData(){
        coupons.removeAll()
        couponsTableView.reloadData()
        gettingData()
        
    }

}
