//
//  ViewController.swift
//  Lost In Translation
//
//  Created by Alexander v. Below on 25.10.15.
//  Copyright © 2015 Alexander von Below. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var locIdentifierLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        languageLabel.text = "Preferred Localization: \(Bundle.main.preferredLocalizations.first!)"
        locIdentifierLabel.text = Locale.current.identifier
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

