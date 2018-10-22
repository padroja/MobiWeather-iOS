//
//  LaunchViewController.swift
//  MobiWeather
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import UIKit
import Lottie

class LaunchViewController: MobiBaseViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var animatedView: UIView!
    
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
        let animator = LOTAnimationView(name: "sun_burst_weather_icon")
        animator.frame = animatedView.bounds
        animator.contentMode = .scaleAspectFill
        animator.animationSpeed = 0.8
        animatedView.addSubview(animator)
        animator.play { (completed) in
            self.navigateToHomeController()
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
