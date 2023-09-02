//
//  ViewController.swift
//  DynamicLoadingDemo
//
//  Created by Duy Quang Dao on 30/8/23.
//

import UIKit
import AnimalInterface
import DyLibRuntimeLoader

class ViewController: UIViewController {

    var animal: Animal!

    @IBOutlet var lbl: UILabel!

    @IBAction func load(sender: UIButton) {
        do {
            animal = try dyLibLoad(withSymbol: "load_animal", fromFramework: .framework(name: "AnimalImplementation"), forType: Animal.self)
            show(title: "Success", message: "Animal implementation is loaded")
        } catch {
            show(title: "Error", message: error.localizedDescription)
        }
    }

    @IBAction func speak(sender: UIButton) {
        show(title: "animal.speak()", message: animal.speak())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = Bundle.main.resourcePath
    }

    private func show(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
}

