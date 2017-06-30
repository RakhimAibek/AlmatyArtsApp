//
//  DetailedPinViewController.swift
//  MyMap
//
//  Created by Aibek Rakhim on 6/29/17.
//  Copyright © 2017 ibek inc. All rights reserved.
//

import UIKit

class DetailedPinViewController: UIViewController {

    @IBOutlet weak var pinImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let place = place else { return }
        titleLabel.text = place.title
        pinImage.image = UIImage(named: place.imagePin!)
    }
    
    @IBAction func backBTNpressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
