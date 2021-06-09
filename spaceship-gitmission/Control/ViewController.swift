//
//  ViewController.swift
//  spaceship-gitmission
//
//  Created by zein rezky chandra on 26/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cokcpitOutlet: UIButton!
    @IBOutlet weak var engineOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func navigateToCockpit(_ sender: UIButton) {
        let cockpitStoryboard = UIStoryboard(name: "Cockpit", bundle: nil)
        let cockpit = cockpitStoryboard.instantiateViewController(withIdentifier: "cockpitstoryboard") as! CockpitViewController
        cockpit.source = .control
        self.present(cockpit, animated: true)
        // test
    }
    
    @IBAction func navigateToEngine(_ sender: UIButton) {
        let engineStoryboard = UIStoryboard(name: "Engine", bundle: nil)
        let engine = engineStoryboard.instantiateViewController(withIdentifier: "engineStoryboard") as! EngineViewController
        engine.source = .control
        self.present(engine, animated: true)
    }
    
    @IBAction func navigateToFuel(_ sender: UIButton) {
        let fuelStoryboard = UIStoryboard(name: "Fuel", bundle: nil)
        let fuel = fuelStoryboard.instantiateViewController(withIdentifier: "fuelStoryboard") as! FuelViewController
        fuel.source = .control
        self.present(fuel, animated: true)
    }
    
    //Navigation to Electrical
    @IBAction func navigateToElectrical(_ sender: UIButton) {
        //create instance of Electrical view controller
        let electricalStoryboard = UIStoryboard(name: "Electrical", bundle: nil)
        let electrical = electricalStoryboard.instantiateViewController(withIdentifier: "electricalStoryboad") as! ElectricalViewController
        //set the source to this view controller
        electrical.source = .control
        //navigate to the electrical
        self.present(electrical, animated: true)
        //
    }
}
