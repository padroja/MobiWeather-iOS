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
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var minMaxTempLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    
    @IBAction func closeAction(_ sender: UIButton) {
        pop()
    }
    
    var localLocation: LocalLocation!
    var weatherDetails: Weather!
    var weatherForecastDetails: WeatherForecast?
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTransistion()
        getForecastDetails()
        configureView()
    }
    
    private func configureTransistion() {
        navTitleLabel.hero.id = "h_city_\(selectedIndex)"
        weatherTypeLabel.hero.id = "h_weatherType_\(selectedIndex)"
        temperatureLabel.hero.id = "h_temperature_\(selectedIndex)"
        weatherImageView.hero.id = "h_weatherImage_\(selectedIndex)"
        navTitleLabel.hero.modifiers = [.arc]
        weatherTypeLabel.hero.modifiers = [.arc]
        temperatureLabel.hero.modifiers = [.arc]
        weatherImageView.hero.modifiers = [.arc]
    }
    
    private func configureView() {
        forecastCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        setUI()
    }
    
    private func setUI() {
        navTitleLabel.text = localLocation.cityName
        temperatureLabel.text = weatherDetails.main?.temp?.getTemperatureString()
        weatherTypeLabel.text = weatherDetails.weatherTypes?.first?.description?.rawValue.capitalized
        weatherImageView.image = weatherDetails.weatherTypes?.first?.description?.icon ?? UIImage(named: "img_cloud_day")
        
        let maxTemp = (weatherDetails.main?.tempMax ?? 273.15).getTemperatureString()
        let minTemp = (weatherDetails.main?.tempMin ?? 273.15).getTemperatureString()
        minMaxTempLabel.text = "\(minTemp)/\(maxTemp)"
        
        windSpeedLabel.text = (weatherDetails.wind?.speed ?? 0).toKphString()
        
        humidityLabel.text = "\(weatherDetails.main?.humidity ?? 0)%"
        
        sunriseLabel.text = weatherDetails.sys?.sunrise?.convertToDayTime()
        sunsetLabel.text = weatherDetails.sys?.sunset?.convertToDayTime()
        
        pressureLabel.text = "\((weatherDetails.main?.pressure ?? 0).rounded(toPlaces: 1)) hPa"
    }
}

extension CityDetailViewController {
    
    private func getForecastDetails() {
        guard let lat = weatherDetails.coord?.lat, let lon = weatherDetails.coord?.lon else { return }
        
        let params: [String : Any] = ["lat": lat,
                                      "lon": lon]
        MobiNetworkService.shared.requestObject(provider: MobiNetworkService.shared.weatherApiProvider,
                                                type: MobiAPIProvider.getForeCast(params: params),
                                                success: { (model: WeatherForecast) in
                                                    self.gotForecastDetails(model: model)
        }) { (error) in
        }
    }
    
    private func gotForecastDetails(model: WeatherForecast) {
        self.weatherForecastDetails = model
        updateDataForForecast()
    }
    
    private func updateDataForForecast() {
        guard let forecastDetails = weatherForecastDetails else { return }
        guard let forecastList = forecastDetails.list, forecastList.count > 0 else { return }
        let maxTemp = (forecastList.compactMap { $0.main?.tempMax }.max() ?? 273.15).getTemperatureString()
        let minTemp = (forecastList.compactMap { $0.main?.tempMin }.min() ?? 273.15).getTemperatureString()
        minMaxTempLabel.text = "\(minTemp)/\(maxTemp)"
        forecastCollectionView.dataSource = self
        forecastCollectionView.reloadData()
    }
}

extension CityDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherForecastDetails?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastListCollectionViewCell", for: indexPath) as? ForecastListCollectionViewCell else { return UICollectionViewCell() }
        
        let forecastData = weatherForecastDetails!.list![indexPath.row]
        cell.configureCell(weather: forecastData)
        
        return cell
    }
}

extension CityDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

