//
//  AcerdadeStaticViewController.swift
//  
//
//  Created by David Garrido Garrido on 28/07/2018.
//

import UIKit

class AcerdadeStaticViewController: UIViewController {

    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var lblVersionApp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnMenuButton.target=revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))        // Do any additional setup after loading the view.
        //First get the nsObject by defining as an optional anyObject
        let appVersionString: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        lblVersionApp.text="Version " + appVersionString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
