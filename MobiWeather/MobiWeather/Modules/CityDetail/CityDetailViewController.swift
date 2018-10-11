//
//  CityDetailViewController.swift
//  MobiWeather
//
//  Created by Parth Adroja on 11/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import UIKit

class CityDetailViewController: MobiBaseViewController {
    
    @IBOutlet weak var navTitleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    
    
    @IBAction func closeAction(_ sender: UIButton) {
        pop()
    }
    
    var weatherDetails: Weather!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTransistion()
        configureView()
    }
    
    private func configureTransistion() {
        navTitleLabel.hero.id = "h_city_\(selectedIndex)"
        weatherTypeLabel.hero.id = "h_weatherType_\(selectedIndex)"
        temperatureLabel.hero.id = "h_temperature_\(selectedIndex)"
    }
    
    private func configureView() {
        setUI()
    }
    
    private func setUI() {
        navTitleLabel.text = weatherDetails.name
        temperatureLabel.text = weatherDetails.main?.temp?.getTemperatureString()
        weatherTypeLabel.text = weatherDetails.weatherTypes?.first?.main
    }
}
