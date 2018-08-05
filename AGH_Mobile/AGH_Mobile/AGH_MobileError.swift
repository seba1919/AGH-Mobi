//
//  Error.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 06.03.2016.
//  Copyright © 2016 MacKN. All rights reserved.
//

import UIKit

class AGH_MobileError: NSObject {
    static func ConnectionError(_ widok:UIViewController){
        let alert = UIAlertController(title: "Uwaga", message: "Brak połączenia z internetem. Sprawdź ustawienia i spróbuj ponownie.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        widok.present(alert, animated: true, completion: nil)
    }
    static func dataIsUnavailable(_ widok:UIViewController){
        let alert = UIAlertController(title: "Uwaga", message: "Nie znaleziono pasującej osoby.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        widok.present(alert, animated: true, completion: nil)
    }
}
