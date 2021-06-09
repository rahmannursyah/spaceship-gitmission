//
//  ElectricalViewController.swift
//  spaceship-gitmission
//
//  Created by zein rezky chandra on 26/05/21.
//

import UIKit

/**/
protocol ElectricalProtocol: AnyObject {
    func navigateToControlRoom()
}

/**/
class ElectricalViewController: UIViewController {

    var source: Access? = .control
    
    weak var delegate: ElectricalProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateToControl(_ sender: UIButton) {
        if source == .control {
            dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true) { [self] in
                delegate?.navigateToControlRoom()
            }
        }
    }
    
    //Navigate to Fuel View Controller
    @IBAction func navigateToFuel(_ sender: UIButton) {
        if source == .fuel {
            dismiss(animated: true, completion: nil)
        } else {
            let fuelStoryboard = UIStoryboard(name: "Fuel", bundle: nil)
            let fuel = fuelStoryboard.instantiateViewController(withIdentifier: "fuelStoryboard") as! FuelViewController
            fuel.source = .electrical
            fuel.delegate = self
            self.present(fuel, animated: true)
        }
    }
    
}

extension ElectricalViewController: FuelProtocol {
    func navigateToControlRoom() {
        dismiss(animated: true, completion: nil)
    }
}
