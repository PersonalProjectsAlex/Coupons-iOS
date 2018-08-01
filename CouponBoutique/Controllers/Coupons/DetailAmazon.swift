//
//  DetailAmazon.swift
//  CouponBoutique
//
//  Created by Mac on 30/7/18.
//  Copyright © 2018 Avalogics. All rights reserved.
//




import UIKit
import WebKit
import NVActivityIndicatorView

class DetailAmazon: UIViewController, WKNavigationDelegate, NVActivityIndicatorViewable{
    // MARK: - Let-Var
    
    var selectedCoupon:Coupon?
    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting up general actions/delegates/Core
        setUpActions()
        
        // setting up UI elements to be used through the code
        setUpUI()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
    
    
    // MARK: - SetUps / Funcs
    func setUpUI(){}
    
    func setUpActions(){
        //Delegating webview
        webView.navigationDelegate = self
        
        // Delete any associated cookies
        Core.shared.cleanCache()
        
        //Setting up url
        guard let site = selectedCoupon?.link else{return}
        guard let url = URL(string: site) else {return}
        webView.load(URLRequest(url: url))
        
        //Set refresh button at Webview
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [refresh]
        
        navigationController?.isToolbarHidden = false
    }
    
    private func gettingData(){}
    
    //Webview
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        customLoading()
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {}
    
    //Indicator
    
    //Custom loading
    func customLoading(){
        let size = CGSize(width: 30, height: 30)
        self.startAnimating(size, message: "...", type: NVActivityIndicatorType.orbit)
    }
    
    @IBAction func bakcAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // MARK: - Objective C
    @objc func splashTimeOut(sender : Timer){
        self.stopAnimating()
    }
}
