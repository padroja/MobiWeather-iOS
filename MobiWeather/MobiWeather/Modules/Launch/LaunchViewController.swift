//
//  LaunchViewController.swift
//  MobiWeather
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import UIKit

class LaunchViewController: MobiBaseViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    private var currentAnimatedImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureInitials()
    }
    
    private func configureView() {
        startWeatherAnimation()
    }
    
    private func startWeatherAnimation() {
        var weatherImages = [#imageLiteral(resourceName: "img_sunny"),#imageLiteral(resourceName: "img_clear_night"),#imageLiteral(resourceName: "img_rain"),#imageLiteral(resourceName: "img_cloudy_night")]
        let image = weatherImages[(currentAnimatedImageIndex % weatherImages.count)]
        
        UIView.transition(with: weatherImageView,
                          duration: 0.7,
                          options: [.transitionCrossDissolve,
                                    .curveEaseOut],
                          animations: {
            self.weatherImageView.image = image
        }) { (finish) in
            self.currentAnimatedImageIndex += 1
            if self.currentAnimatedImageIndex < weatherImages.count {
                self.startWeatherAnimation()
            } else {
                self.navigateToHomeController()
            }
        }
    }
    
    private func navigateToHomeController() {
        let controller = HomeViewController.instantiateFrom(appStoryboard: .Main)
        push(controller)
    }
    
    private func configureInitials() {
        UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
}
