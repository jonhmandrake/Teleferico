//
//  MenuViewController.swift
//  TelefericoMadrid
//
//  Created by David Garrido Garrido on 28/07/2018.
//  Copyright © 2018 David Garrido Garrido. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var menuNameArr:Array = [String]()
    var iconeImage:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuNameArr = ["Mapa","Realidad Aumentada","Idiomas","Acerca de","Tarifas y horarios"]
        iconeImage = [UIImage(named: "mapa_ic")!,UIImage(named: "ra_ic")!,UIImage(named: "idioma_ic")!,UIImage(named: "acerca_ic")!,UIImage(named: "info_ic")!]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
        cell.imgIcon.image = iconeImage[indexPath.row]
        cell.lblMenuName.text!=menuNameArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.lblMenuName.text!=="Mapa"
        {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController=mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text!=="Realidad Aumentada"
        {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController=mainStoryboard.instantiateViewController(withIdentifier: "RealidadAumentadaViewController") as! RealidadAumentadaViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text!=="Idiomas"
        {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController=mainStoryboard.instantiateViewController(withIdentifier: "IdiomasViewController") as! IdiomasViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text!=="Tarifas y horarios"
        {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController=mainStoryboard.instantiateViewController(withIdentifier: "AcercaWebViewController") as! AcercaWebViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text!=="Acerca de"
        {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController=mainStoryboard.instantiateViewController(withIdentifier: "AcerdadeStaticViewController") as! AcerdadeStaticViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
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
