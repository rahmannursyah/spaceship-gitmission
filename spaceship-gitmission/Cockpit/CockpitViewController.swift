//
//  CockpitViewController.swift
//  spaceship-gitmission
//
//  Created by zein rezky chandra on 26/05/21.
//

import UIKit

protocol CockpitProtocol: AnyObject {
    func navigateToControlRoom()
}

class CockpitViewController: UIViewController {

    var source: Access? = .control
    
    weak var delegate: CockpitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateToEngine(_ sender: UIButton) {
        if source == .engine {
            dismiss(animated: true, completion: nil)
        } else {
            let engineStoryboard = UIStoryboard(name: "Engine", bundle: nil)
            let engine = engineStoryboard.instantiateViewController(withIdentifier: "engineStoryboard") as! EngineViewController
            engine.source = .cockpit
            engine.delegate = self
            present(engine, animated: true)
        }
    }
    
    @IBAction func navigateToControl(_ sender: UIButton) {
        if source == .engine {
            dismiss(animated: true) { [self] in
                delegate?.navigateToControlRoom()
            }
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}

extension CockpitViewController: EngineProtocol {
    func navigateToControlRoom() {
        dismiss(animated: true, completion: nil)
    }
}
