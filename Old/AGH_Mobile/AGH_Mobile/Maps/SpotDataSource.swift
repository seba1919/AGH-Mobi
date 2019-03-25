//
//  SpotDataSource.swift
//  AGH_Mobile
//
//  Created by patrycja on 16.11.2017.
//  Copyright © 2017 mackn. All rights reserved.
//

import UIKit
import MapKit

class SpotDataSource: NSObject {
    
    public static var spotsColor: [String : UIColor] =
        ["Wydziały" : UIColor.blue,
         "Stołówki" : UIColor(red: 60/255, green: 170/255, blue: 250/255, alpha: 1.0),
         "Sklepy" : UIColor.darkGray,
         "Kawiarnie" : UIColor(red: 76/255, green: 202/255, blue: 19/255, alpha: 1.0),
         "Kluby" : UIColor.purple,
         "Sport" : UIColor.blue,
         "Ksero" : UIColor.gray,
         "Bankomaty" : UIColor(red: 76/255, green: 202/255, blue: 19/255, alpha: 1.0),
         "Akademiki" : UIColor.red,
         "Rowery" : UIColor.orange,
         "Budynki AGH" : UIColor.blue]
    
    public static var spotTypes = ["Wydziały": #imageLiteral(resourceName: "wydzialy"), "Budynki AGH": #imageLiteral(resourceName: "budynki"), "Stołówki": #imageLiteral(resourceName: "stolowki"), "Kawiarnie": #imageLiteral(resourceName: "kawiarnie"), "Kluby": #imageLiteral(resourceName: "beer"), "Akademiki": #imageLiteral(resourceName: "building"), "Sport": #imageLiteral(resourceName: "sport"), "Ksero": #imageLiteral(resourceName: "ksero"), "Bankomaty": #imageLiteral(resourceName: "bankomaty"), "Rowery": #imageLiteral(resourceName: "bicycle"), "Sklepy": #imageLiteral(resourceName: "sklepy")]
    
    static var spots: [Spot] = [
        Spot(type: "Wydziały", name: "A0", latitude: 50.064506, longitude: 19.923320),
        Spot(type: "Wydziały", name: "A1", latitude: 50.065096, longitude: 19.922538),
        Spot(type: "Wydziały", name: "A2", latitude: 50.065243, longitude: 19.921860),
        Spot(type: "Wydziały", name: "A3/A4", latitude: 50.065498, longitude: 19.919993),
        Spot(type: "Wydziały", name: "C1", latitude: 50.065390, longitude: 19.922709),
        Spot(type: "Wydziały", name: "C2", latitude: 50.065879, longitude: 19.922677),
        Spot(type: "Wydziały", name: "C3", latitude: 50.066142, longitude: 19.921592),
        Spot(type: "Wydziały", name: "C4", latitude: 50.065656, longitude: 19.920103),
        Spot(type: "Wydziały", name: "B1", latitude: 50.065985, longitude: 19.919424),
        Spot(type: "Wydziały", name: "B2", latitude: 50.066087, longitude: 19.918793),
        Spot(type: "Wydziały", name: "B3", latitude: 50.066262, longitude: 19.918159),
        Spot(type: "Wydziały", name: "B4", latitude: 50.066350, longitude: 19.917560),
        Spot(type: "Wydziały", name: "B5", latitude: 50.067120, longitude: 19.917017),
        Spot(type: "Wydziały", name: "B6", latitude: 50.066235, longitude: 19.916428),
        Spot(type: "Wydziały", name: "B7", latitude: 50.067348, longitude: 19.916514),
        Spot(type: "Wydziały", name: "D4", latitude: 50.065779, longitude: 19.917527),
        Spot(type: "Wydziały", name: "D5", latitude: 50.067054, longitude: 19.915246),
        Spot(type: "Wydziały", name: "D6", latitude: 50.066817, longitude: 19.914900),
        Spot(type: "Wydziały", name: "D8", latitude: 50.066604, longitude: 19.910975),
        Spot(type: "Wydziały", name: "D11", latitude: 50.067325, longitude: 19.912103),
        Spot(type: "Wydziały", name: "D17", latitude: 50.068063, longitude: 19.912603),
        
        Spot(type: "Stołówki", name: "Limonkova", latitude: 50.066499, longitude: 19.921115),
        Spot(type: "Stołówki", name: "Tawo", latitude: 50.065507, longitude: 19.918454),
        Spot(type: "Stołówki", name: "Obieżyświat", latitude: 50.066806, longitude: 19.920131),
        Spot(type: "Stołówki", name: "Krakus", latitude: 50.065304, longitude: 19.917224),
        Spot(type: "Stołówki", name: "Stołówka Nawojka", latitude: 50.064948, longitude: 19.918531),
        Spot(type: "Stołówki", name: "Suto Handroll", latitude: 50.067466, longitude: 19.914764),
        Spot(type: "Stołówki", name: "Pizzeria DaGrasso", latitude: 50.067741, longitude: 19.915427),
        Spot(type: "Stołówki", name: "Makarun Kawiory", latitude: 50.068057, longitude: 19.910493),
        Spot(type: "Stołówki", name: "Zapieksy i Kebsy", latitude: 50.068084, longitude: 19.909798),
        Spot(type: "Stołówki", name: "Pizzeria Babilon", latitude: 50.067850, longitude: 19.907075),
        Spot(type: "Stołówki", name: "Fresh", latitude: 50.067700, longitude: 19.911876),
        Spot(type: "Stołówki", name: "Świniarnia", latitude: 50.068705, longitude: 19.907863),
        Spot(type: "Stołówki", name: "Oliwka", latitude: 50.068881, longitude: 19.904406),
        Spot(type: "Stołówki", name: "Góra Olimp Pizza & Pub", latitude: 50.066595, longitude: 19.922715),
        Spot(type: "Stołówki", name: "Automat B4", latitude: 50.066309, longitude: 19.917402),
        Spot(type: "Stołówki", name: "Automat C2", latitude: 50.066243, longitude: 19.921300),
        
        Spot(type: "Sklepy", name: "Avita", latitude: 50.066797, longitude: 19.921937),
        Spot(type: "Sklepy", name: "Żabka", latitude: 50.067419, longitude: 19.914247),
        Spot(type: "Sklepy", name: "Lewiatan", latitude: 50.068725, longitude: 19.907582),
        
        Spot(type: "Kawiarnie", name: "Kawiory 8 Café", latitude: 50.067685, longitude: 19.913401),
        Spot(type: "Kawiarnie", name: "Microscup", latitude: 50.067438, longitude: 19.918633),
        Spot(type: "Kawiarnie", name: "Limonkova 4p", latitude: 50.066499, longitude: 19.921115),
        Spot(type: "Kawiarnie", name: "Buczek", latitude: 50.066714, longitude: 19.922453),
        Spot(type: "Kawiarnie", name: "Awiteks Kawiory", latitude: 50.067575, longitude: 19.912943),
        Spot(type: "Kawiarnie", name: "Awiteks MS", latitude: 50.069972, longitude: 19.905891),
        
        Spot(type: "Kluby", name: "Karlik", latitude: 50.066081, longitude: 19.914434),
        Spot(type: "Kluby", name: "Gwarek", latitude: 50.065943, longitude: 19.915678),
        Spot(type: "Kluby", name: "Studio", latitude: 50.068088, longitude: 19.908289),
        Spot(type: "Kluby", name: "Zaścianek", latitude: 50.068054, longitude: 19.905428),
        Spot(type: "Kluby", name: "Filutek", latitude: 50.069235, longitude: 19.905748),
        
        Spot(type: "Sport", name: "Basen AGH", latitude: 50.068487, longitude: 19.901002),
        Spot(type: "Sport", name: "Siłownia AGH", latitude: 50.068747, longitude: 19.900998),
        Spot(type: "Sport", name: "SWFiS", latitude: 50.066139, longitude: 19.900842),
        Spot(type: "Sport", name: "Boisko piłkarskie", latitude: 50.068230, longitude: 19.904289),
        Spot(type: "Sport", name: "Boisko koszykarskie", latitude: 50.067976, longitude: 19.905762),
        Spot(type: "Sport", name: "Korty tenisowe", latitude: 50.067636, longitude: 19.904076),
        Spot(type: "Sport", name: "Kręgielnia", latitude: 50.068382, longitude: 19.900664),
        
        Spot(type: "Ksero", name: "CopyHeaven", latitude: 50.066928, longitude: 19.920153),
        Spot(type: "Ksero", name: "Drukmania", latitude: 50.067308, longitude: 19.920605),
        Spot(type: "Ksero", name: "Olimp Ksero Druk", latitude: 50.066720, longitude: 19.922801),
        Spot(type: "Ksero", name: "Ksero kawiory", latitude: 50.067662, longitude: 19.913162),
        Spot(type: "Ksero", name: "Ksero Kapitol", latitude: 50.067815, longitude: 19.907074),
        Spot(type: "Ksero", name: "Ksero Atio.pl", latitude: 50.068977, longitude: 19.907723),
        
        Spot(type: "Bankomaty", name: "Pekao SA", latitude: 50.065276, longitude: 19.922834),
        Spot(type: "Bankomaty", name: "BZWBK", latitude: 50.065345, longitude: 19.916651),
        Spot(type: "Bankomaty", name: "BZWBK", latitude: 50.065898, longitude: 19.915587),
        Spot(type: "Bankomaty", name: "Euronet", latitude: 50.066880, longitude: 19.920129),
        Spot(type: "Bankomaty", name: "Euronet", latitude: 50.067474, longitude: 19.914696),
        Spot(type: "Bankomaty", name: "Euronet", latitude: 50.068684, longitude: 19.906815),
        Spot(type: "Bankomaty", name: "ING", latitude: 50.068792, longitude: 19.904801),
        
        Spot(type: "Akademiki", name: "DS1 Olimp", latitude: 50.068912, longitude: 19.904270),
        Spot(type: "Akademiki", name: "DS2 Babilon", latitude: 50.069280, longitude: 19.904877),
        Spot(type: "Akademiki", name: "DS3 Akropol", latitude: 50.069438, longitude: 19.902882),
        Spot(type: "Akademiki", name: "DS4 Filutek", latitude: 50.069385, longitude: 19.905790),
        Spot(type: "Akademiki", name: "DS5 Strumyk", latitude: 50.068958, longitude: 19.905641),
        Spot(type: "Akademiki", name: "DS6 Bratek", latitude: 50.068445, longitude: 19.905346),
        Spot(type: "Akademiki", name: "DS7 Zaścianek", latitude: 50.068167, longitude: 19.905142),
        Spot(type: "Akademiki", name: "DS8 Stokrotka", latitude: 50.067553, longitude: 19.905112),
        Spot(type: "Akademiki", name: "DS9 Strumyk", latitude: 50.069137, longitude: 19.906925),
        Spot(type: "Akademiki", name: "DS10 Hajduczek", latitude: 50.068636, longitude: 19.906876),
        Spot(type: "Akademiki", name: "DS11 Bonus", latitude: 50.068235, longitude: 19.906719),
        Spot(type: "Akademiki", name: "DS12 Promyk", latitude: 50.067843, longitude: 19.906222),
        Spot(type: "Akademiki", name: "DS13 Straszny Dwór", latitude: 50.067411, longitude: 19.906162),
        Spot(type: "Akademiki", name: "DS14 Kapitol", latitude: 50.067636, longitude: 19.907207),
        Spot(type: "Akademiki", name: "DS15 Maraton", latitude: 50.068082, longitude: 19.901602),
        Spot(type: "Akademiki", name: "DS16 Itaka", latitude: 50.068522, longitude: 19.901810),
        Spot(type: "Akademiki", name: "DS17 Arkadia", latitude: 50.068954, longitude: 19.902119),
        Spot(type: "Akademiki", name: "DS Alfa", latitude: 50.065910, longitude: 19.914388),
        
        Spot(type: "Rowery", name: "Wavelo MS", latitude: 50.069980, longitude: 19.905225),
        Spot(type: "Rowery", name: "Wavelo Czarnowiejska", latitude: 50.066909, longitude: 19.921704),
        Spot(type: "Rowery", name: "Wavelo Reymonta", latitude: 50.065835, longitude: 19.914130),
        Spot(type: "Rowery", name: "Wavelo Reymonta-Kapitol", latitude: 50.066909, longitude: 19.906405),
        Spot(type: "Rowery", name: "Wavelo Kawiory", latitude: 50.068734, longitude: 19.913637),
        
        Spot(type: "Budynki AGH", name: "Biblioteka Główna", latitude: 50.065715, longitude: 19.921495),
        Spot(type: "Budynki AGH", name: "Centrum Dydaktyki", latitude: 50.064664, longitude: 19.920540),
    ]
    
    override init() {
        
    }
    
    static func getSpotList(spotType: String) -> [Spot] {
        return spots.filter { $0.type == spotType }
    }
    
    static func getParticularSpot(spotName: String) -> [Spot] {
        return spots.filter { $0.name == spotName }
    }
    
    static func sortByLocation(spotsList: [Spot], userLocation: CLLocation) -> [Spot] {
        return spotsList.sorted( by: { $0.distance(to: userLocation) < $1.distance(to: userLocation) } )
    }
}
