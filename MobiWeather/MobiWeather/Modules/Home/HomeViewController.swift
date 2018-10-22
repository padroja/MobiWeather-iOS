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
        let locationPickerController = LocationPickerViewController.instantiateFrom(appStoryboard: .locationPicker)
        locationPickerController.delegate = self
        present(locationPickerController)
    }
    
    var locationPlaces: [LocalLocation]?
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        refreshControl.addTarget(self, action: #selector(refreshLocations), for: .valueChanged)
        locationTableView.refreshControl = refreshControl
        locationTableView.allowsMultipleSelectionDuringEditing = false
        updateLocationTable()
    }
    
    @objc private func refreshLocations() {
        locationPlaces?.removeAll()
        locationTableView.reloadData()
        updateLocationTable()
        refreshControl.endRefreshing()
    }
    
    private func updateLocationTable() {
        if let locations = LocalStorageManager.getLocations(), locations.count > 0 {
            locationPlaces = locations
        }
        locationTableView.reloadData()
    }
    
    private func navigateToCityDetail(details: Weather, localLocation: LocalLocation, selectedIndex: Int) {
        let cityDetailController = CityDetailViewController.instantiateFrom(appStoryboard: .main)
        cityDetailController.weatherDetails = details
        cityDetailController.localLocation = localLocation
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
            cell.setupTransistionData(index: indexPath.row)
            navigateToCityDetail(details: weatherDetails, localLocation: cell.localLocation, selectedIndex: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            LocalStorageManager.remove(location: locationPlaces![indexPath.row])
            locationPlaces?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension HomeViewController: LocationPickerDelegate {
    
    func locationPickerDidAddLocations() {
        updateLocationTable()
    }
}
