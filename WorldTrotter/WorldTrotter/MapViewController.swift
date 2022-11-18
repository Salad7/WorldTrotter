//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Mohamed Salad on 11/18/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBAction func segmentBtn(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Selected Index 0")
            map.mapType = .standard
        case 1:
            print("Selected Index 1")
            map.mapType = .hybrid

        case 2:
            print("Selected Index 2")
            map.mapType = .satellite

        default:
            print("oppa")
        }
    }
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
