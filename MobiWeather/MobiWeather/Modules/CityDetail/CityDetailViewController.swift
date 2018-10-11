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
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss()
    }
    
    var weatherDetails: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        navTitleLabel.text = weatherDetails.name
    }
}
