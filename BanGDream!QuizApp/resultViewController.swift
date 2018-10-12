//
//  resultViewController.swift
//  BanGDream!QuizApp
//
//  Created by アポカリプス・ティア on 2018/06/14.
//  Copyright © 2018年 アポカリプス・ティア. All rights reserved.
//

import UIKit
import GoogleMobileAds

class resultViewController: UIViewController {
    
    var bannerView: GADBannerView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var scoreResult = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = scoreResult
        
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)  // バナーのサイズは決まってるのでそれによって合わせる
        
        addBannerViewToView(bannerView)
        //        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716" // ここを自分のユニットIDに変更する ca-app-pub-6416476542651492/6714550961
        bannerView.adUnitID = "ca-app-pub-9102767441102759/3606716796"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
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

