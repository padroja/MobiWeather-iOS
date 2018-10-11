//
//  HomeWeatherLocationTableViewCell.swift
//  MobiWeather
//
//  Created by Parth Adroja on 11/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import UIKit

class HomeWeatherLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var weatherTypeImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var localLocation: LocalLocation!
    var weatherModel: Weather?
    var isRequestingWeather = false
    var forceRefreshCell = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(location: LocalLocation) {
        if localLocation != nil {
            if localLocation.location != location.location {
                forceRefreshCell = true
            }
        }
        localLocation = location
        setInitialData()
        updateCellUI()
    }
    
    private func setInitialData() {
        if weatherModel == nil {
            cityNameLabel.text = localLocation.cityName
            weatherTypeLabel.text = ""
            temperatureLabel.text = "-- --°"
        }
    }
    
    private func updateCellUI() {
        if forceRefreshCell {
            getWeatherDetails()
            return
        }
        
        if let weatherDetails = weatherModel {
            cityNameLabel.text = weatherDetails.name
            weatherTypeLabel.text = weatherDetails.weatherTypes?.first?.main
            temperatureLabel.text = weatherDetails.main?.temp?.getTemperatureString()
        } else {
            if !isRequestingWeather {
                getWeatherDetails()
            }
        }
    }
    
    private func getWeatherDetails() {
        isRequestingWeather = true
        let coordinates = localLocation.location
        let params = ["lat" : coordinates.getCoordinates.lat,
                      "lon" : coordinates.getCoordinates.lon]
        MobiNetworkService.shared.requestObject(provider: MobiNetworkService.shared.weatherApiProvider,
                                                type: MobiAPIProvider.getWeather(params: params),
                                                success: { (model: Weather) in
                                                    self.isRequestingWeather = false
                                                    self.forceRefreshCell = false
                                                    self.weatherModel = model
                                                    self.updateCellUI()
        }) { (error) in
        }
    }
}
