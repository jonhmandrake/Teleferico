//
//  ViewController.swift
//  TelefericoMadrid
//
//  Created by David Garrido Garrido on 27/07/2018.
//  Copyright © 2018 David Garrido Garrido. All rights reserved.
//

import UIKit
import ArcGIS

class ViewController: UIViewController, CustomContextSheetDelegate  {
    
    
    
    
    @IBOutlet weak var mapView: AGSMapView!
    private var geodatabase:AGSGeodatabase!
    
    @IBOutlet weak var bannerLabel: UILabel!
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    
    var portalItem:AGSPortalItem!
    var map:AGSMap!
    private var sheet:CustomContextSheet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnMenuButton.target=revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
        
        let url = URL(string: "http://www.arcgis.com")
        let portalMap=AGSPortal(url: url!, loginRequired: false)
        let m=AGSPortalItem(portal: portalMap, itemID: "5151efdefa5240adb379b8ba4cb4972d")
        
        //initialize map with a basemap
        let map = AGSMap(item: m)
        self.mapView.map = map
        self.mapView.locationDisplay.autoPanModeChangedHandler = { [weak self] (autoPanMode:AGSLocationDisplayAutoPanMode) in
            DispatchQueue.main.async {
                self?.sheet.selectedIndex = autoPanMode.rawValue + 1
            }}
       // (self.navigationItem.rightBarButtonItem as! SourceCodeBarButtonItem).filenames = ["DisplayLocationViewController"]
        //setup the context sheet
        self.sheet = CustomContextSheet(images: ["LocationDisplayDisabledIcon", "LocationDisplayOffIcon", "LocationDisplayDefaultIcon", "LocationDisplayNavigationIcon2", "LocationDisplayHeadingIcon2"], highlightImages: nil, titles: ["Stop", "On", "Re-Center", "Navigation", "Compass"])
        self.sheet.translatesAutoresizingMaskIntoConstraints = false
        self.sheet.delegate = self
       
        self.view.addSubview(self.sheet)
        //assign the map to the map view
        self.map?.addObserver(self, forKeyPath: "loadStatus", options: .new, context: nil)
        
    
    }
        
        
        
        //for selection on the context sheet
        //update the autoPanMode based on the selection
        func customContextSheet(_ customContextSheet: CustomContextSheet, didSelectItemAtIndex index: Int) {
            switch index {
            case 0:
                self.mapView.locationDisplay.stop()
            case 1:
                self.startLocationDisplay(with: AGSLocationDisplayAutoPanMode.off)
            case 2:
                self.startLocationDisplay(with: AGSLocationDisplayAutoPanMode.recenter)
            case 3:
                self.startLocationDisplay(with: AGSLocationDisplayAutoPanMode.navigation)
            default:
                self.startLocationDisplay(with: AGSLocationDisplayAutoPanMode.compassNavigation)
            }
        }
        
        //to start location display, the first time
        //dont forget to add the location request field in the info.plist file
        func startLocationDisplay(with autoPanMode:AGSLocationDisplayAutoPanMode) {
            self.mapView.locationDisplay.autoPanMode = autoPanMode
            self.mapView.locationDisplay.start { (error:Error?) -> Void in
                if let error = error {
                    //SVProgressHUD.showError(withStatus: error.localizedDescription)
                    
                    //update context sheet to Stop
                    self.sheet.selectedIndex = 0
                }
            }
        }
        
        
        
        
        
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        //update the banner label on main thread
        DispatchQueue.main.async { [weak self] in
            
            //get the string for load status
            if let strongSelf = self, let loadStatus = strongSelf.map?.loadStatus {
                
                let loadStatusString = strongSelf.loadStatusString(loadStatus)
                
                //set it on the banner label
                strongSelf.bannerLabel.text = "Load status : \(loadStatusString)"
            }
        }
    }
    
    private func loadStatusString(_ status: AGSLoadStatus) -> String {
        switch status {
        case .failedToLoad:
            return "Failed_To_Load"
        case .loaded:
            return "Loaded"
        case .loading:
            return "Loading"
        case .notLoaded:
            return "Not_Loaded"
        default:
            return "Unknown"
        }
    }
    
    deinit {
        self.map?.removeObserver(self, forKeyPath: "loadStatus")
    }
}
