//
//  HomeViewController.swift
//  MobiWeather
//
//  Created by Parth Adroja on 10/10/18.
//  Copyright © 2018 Parth Adroja. All rights reserved.
//

import UIKit
import Hero

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
        locationTableView.allowsMultipleSelectionDuringEditing = false
        updateLocationTable()
    }
    
    private func updateLocationTable() {
        if let locations = LocalStorageManager.getLocations(), locations.count > 0 {
            locationPlaces = locations
        }
        locationTableView.reloadData()
    }
    
    private func navigateToCityDetail(details: Weather, selectedIndex: Int) {
        let cityDetailController = CityDetailViewController.instantiateFrom(appStoryboard: .Main)
        cityDetailController.weatherDetails = details
        cityDetailController.selectedIndex = selectedIndex
        push(cityDetailController)
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
        cell.configureCell(location: location, index: indexPath.row)
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? HomeWeatherLocationTableViewCell else {
            return
        }
        
        if let weatherDetails = cell.weatherModel {
            navigateToCityDetail(details: weatherDetails, selectedIndex: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            LocalStorageManager.remove(location: locationPlaces![indexPath.row])
            locationPlaces?.remove(at: indexPath.row)
            updateLocationTable()
        }
    }
}

extension HomeViewController: LocationPickerDelegate {
    
    func locationPickerDidAddLocations() {
        updateLocationTable()
    }
}
