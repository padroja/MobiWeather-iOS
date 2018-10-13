//
//  ForecastListCollectionViewCell.swift
//  MobiWeather
//
//  Created by Parth Adroja on 12/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import UIKit

class ForecastListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var forecastImageView: UIImageView!
    @IBOutlet weak var forecastTempLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func configureCell(weather: Weather) {
        forecastImageView.image = nil
        let icon = weather.weatherTypes?.first?.icon ?? "50d"
        let imageString = "http://openweathermap.org/img/w/\(icon).png"
        forecastImageView.setImage(with: imageString, indicator: true)
        forecastTempLabel.text = weather.main?.temp?.getTemperatureString()
        timeLabel.text = weather.dt?.convertToDayTime()
    }
}
