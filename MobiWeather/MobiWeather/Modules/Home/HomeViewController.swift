//
//  HomeViewController.swift
//  MobiWeather
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import UIKit

class HomeViewController: MobiBaseViewController {

    @IBOutlet weak var addLocationButton: UIButton!
    @IBOutlet weak var locationTableView: UITableView!
    
    @IBAction func addLocationAction(_ sender: UIButton) {
        let locationPickerController = LocationPickerViewController.instantiateFrom(appStoryboard: .LocationPicker)
        locationPickerController.delegate = self
        present(locationPickerController)
    }
    
    var locationPlaces: [LocalLocation]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        updateLocationTable()
    }
    
    private func updateLocationTable() {
        if let locations = LocalStorageManager.getLocations(), locations.count > 0 {
            locationPlaces = locations
        }
        locationTableView.reloadData()
    }
    
    private func navigateToCityDetail(details: Weather) {
        let cityDetailController = CityDetailViewController.instantiateFrom(appStoryboard: .Main)
        cityDetailController.weatherDetails = details
        present(cityDetailController)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationPlaces?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeWeatherLocationTableViewCell", for: indexPath) as? HomeWeatherLocationTableViewCell else {
            return UITableViewCell()
        }
        let location = locationPlaces![indexPath.row]
        cell.configureCell(location: location)
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? HomeWeatherLocationTableViewCell else {
            return
        }
        
        if let weatherDetails = cell.weatherModel {
            navigateToCityDetail(details: weatherDetails)
        }
    }
}

extension HomeViewController: LocationPickerDelegate {
    
    func locationPickerDidAddLocations() {
        updateLocationTable()
    }
}
