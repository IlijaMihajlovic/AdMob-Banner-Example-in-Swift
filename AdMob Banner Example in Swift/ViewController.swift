//
//  ViewController.swift
//  AdMob Banner Example in Swift
//
//  Created by Ilija Mihajlovic on 9/9/17.
//  Copyright © 2017 Ilija Mihajlovic. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController,GADBannerViewDelegate {
    
    //Important: Replace the "AdMob Banner Unit ID" With the Unit ID You've got by registering your app at: https://www.google.com/admob/
    
    let ADMOB_BANNER_UNIT_ID = "ca-app-pub-8763730921605251/8142198530"
    
    // AdMob banner
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
        initAdMobBanner()
        showBanner(bannerView)
        
    }
    
    // MARK: -  ADMOB BANNER
    func initAdMobBanner() {
        if UIDevice.current.userInterfaceIdiom == .phone {
            // iPhone
            bannerView.adSize =  GADAdSizeFromCGSize(CGSize(width: 320, height: 50))
            bannerView.frame = CGRect(x: 0, y: view.frame.size.height, width: 320, height: 50)
            setUpAdMob()
            
        } else {
            // iPad
            bannerView.adSize =  GADAdSizeFromCGSize(CGSize(width: 468, height: 60))
            bannerView.frame = CGRect(x: 0, y: view.frame.size.height, width: 468, height: 60)
            setUpAdMob()
        }
    }
    
    
    // Hide the banner
    func hideBanner(_ banner: UIView) {
        UIView.beginAnimations("hideBanner", context: nil)
        banner.frame = CGRect(x: view.frame.size.width/2 - banner.frame.size.width/2, y: view.frame.size.height - banner.frame.size.height, width: banner.frame.size.width, height: banner.frame.size.height)
        UIView.commitAnimations()
        banner.isHidden = true
    }
    
    // Show the banner
    func showBanner(_ banner: UIView) {
        UIView.beginAnimations("showBanner", context: nil)
        banner.frame = CGRect(x: view.frame.size.width/2 - banner.frame.size.width/2, y: view.frame.size.height - banner.frame.size.height, width: banner.frame.size.width, height: banner.frame.size.height)
        UIView.commitAnimations()
        banner.isHidden = false
    }
    
    
    func setUpAdMob() {
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        bannerView.adUnitID = ADMOB_BANNER_UNIT_ID
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.load(request)
        
        // AdMob banner available
        func adViewDidReceiveAd(_ view: GADBannerView) {
            showBanner(bannerView)
        }
        
        // NO AdMob banner available
        func adView(_ view: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
            hideBanner(bannerView)
        }
        
    }
}




