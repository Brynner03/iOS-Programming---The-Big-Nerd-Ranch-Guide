//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Brynner Ventura on 8/13/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    var pointsOfInterestSwitch: UISwitch!
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as the view of this view controller
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self,
            action: #selector(mapTypeChanged(_:)),
            for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let pointsOfInterestLabel = UILabel()
        pointsOfInterestLabel.text = "Points of Interest"
        pointsOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsOfInterestLabel)
        
        let labelTopConstraint = pointsOfInterestLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        let labelLeadingConstraint = pointsOfInterestLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        
        labelTopConstraint.isActive = true
        labelLeadingConstraint.isActive = true
        
        pointsOfInterestSwitch = UISwitch()
        pointsOfInterestSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsOfInterestSwitch)
        
        let switchTopConstraint = pointsOfInterestSwitch.topAnchor.constraint(equalTo: pointsOfInterestLabel.topAnchor)
        let switchTrailingConstraint = pointsOfInterestSwitch.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        
        switchTopConstraint.isActive = true
        switchTrailingConstraint.isActive = true
        
        pointsOfInterestSwitch.addTarget(self, action: #selector(pointsOfInterestSwitchChanged(_:)), for: .valueChanged)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view")
    }
    
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    @objc func pointsOfInterestSwitchChanged(_ sender: UISwitch) {
        mapView.pointOfInterestFilter = sender.isOn ? .includingAll : .excludingAll
    }
    
}
