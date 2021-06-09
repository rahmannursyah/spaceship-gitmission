//
//  FuelViewController.swift
//  spaceship-gitmission
//
//  Created by zein rezky chandra on 26/05/21.
//

import UIKit

protocol FuelProtocol: AnyObject {
    func navigateToControlRoom()
}

class FuelViewController: UIViewController {

    var source: Access? = .control
    
    weak var delegate: FuelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func navigateToElectrical(_ sender: UIButton) {
        if source == .electrical {
            dismiss(animated: true, completion: nil)
        } else {
            let electricalStoryboard = UIStoryboard(name: "Electrical", bundle: nil)
            let electrical = electricalStoryboard.instantiateViewController(withIdentifier: "electricalStoryboad") as! ElectricalViewController
            electrical.source = .fuel
            electrical.delegate = self
            self.present(electrical, animated: true)
        }
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
    
}

extension FuelViewController: ElectricalProtocol {
    func navigateToControlRoom() {
        dismiss(animated: true, completion: nil)
    }
}
