//
//  AcercaWebViewController.swift
//  
//
//  Created by David Garrido Garrido on 28/07/2018.
//

import UIKit
import WebKit
class AcercaWebViewController: UIViewController {

    
    
    
    @IBOutlet var containerView: UIView!
    
    var webView: WKWebView?
    
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let targeturl = URL(string:"https://telefericomadrid.es/")
        let req = URLRequest(url: targeturl!)
        self.webView!.load(req)
        
        btnMenuButton.target=revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
 
        
        

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
        self.webView = WKWebView()
        self.view = self.webView
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func loadView() {
        super.loadView()
        self.webView = WKWebView()
        self.view = self.webView
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
