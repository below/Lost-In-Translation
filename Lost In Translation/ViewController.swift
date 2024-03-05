//
//  ViewController.swift
//  Lost In Translation
//
//  Created by Alexander v. Below on 25.10.15.
//  Copyright © 2015 Alexander von Below. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIHostingController<TranslationView> {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(rootView: TranslationView())
    }
}

