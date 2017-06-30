//
//  Place.swift
//  MyMap
//
//  Created by Aibek Rakhim on 6/20/17.
//  Copyright © 2017 ibek inc. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    
    var pinTintColor: UIColor?
    var category: String?
    var imagePin: String?
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate: CLLocationCoordinate2D, category:String, pinTintColor:UIColor, imagePin: String) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.pinTintColor = pinTintColor
        self.imagePin = imagePin
    }
    
    static func loadPlaces() -> [Place] {
        return [
        Place(title: "ТРЦ Аружан", subtitle: "Ильяс Жансугирулы 8/2", coordinate: CLLocationCoordinate2DMake(51.161098, 71.484139), category: "Торговый центр", pinTintColor: .yellow, imagePin: "chimbulak"),
        Place(title: "ТРЦ Гульжан", subtitle: "просп. Абылай хан 32", coordinate: CLLocationCoordinate2DMake(51.154611, 71.485688), category: "Торговый центр", pinTintColor: .red, imagePin: "esentaiAlmaty"),
        Place(title: "ТРЦ Керуен", subtitle: "ул. Достык 9", coordinate: CLLocationCoordinate2DMake(51.128282, 71.425380), category: "Торговый центр", pinTintColor: .blue, imagePin: "medeoAlmaty"),
        Place(title: "Нур Астана Мечеть", subtitle: "ул. Достык 2", coordinate: CLLocationCoordinate2DMake(51.127898, 71.415832), category: "Мечеть", pinTintColor: .green, imagePin: "medeoAlmaty"),
        Place(title: "Хазрет Султан Мечеть", subtitle: "просп. Тауелсиздик 48", coordinate: CLLocationCoordinate2DMake(51.126806, 71.472631), category: "Мечеть", pinTintColor: .green, imagePin: "chimbulak")
        ]
    }
}

