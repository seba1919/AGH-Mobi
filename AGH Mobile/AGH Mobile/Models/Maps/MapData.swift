//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

// MARK: - MapData Model Description
/**
 ```
 // MARK: Example of usage
 guard let url = Bundle.main.url(forResource: "MapCategoryBuildings",
                                 withExtension: "geojson") else {
     return
 }
 
 do {
     let jsonData = try Data(contentsOf: url)
     let result = try JSONDecoder().decode(MapData.self,
                                           from: jsonData)
     for feature in result.features {
         print(feature.properties.name)
     }
 } catch {
     print("Error while parsing: \(error)")
 }
 ```
 Example geojson data
 ```
 {
     "type": "FeatureCollection",
     "features": [
         {
             "type": "Feature",
             "properties": {
                 "markerColor": "#bc1387",
                 "name": "A1"
             },
             "geometry": {
                 "type": "Point",
                 "coordinates": [
                     19.922538,
                     40.643548
                 ]
             }
         }
     ]
 }
 ```
*/
struct MapData: Decodable {
    let type: String
    let features: [Feature]
}

struct Feature: Decodable {
    let type: String
    let properties: Properties
    let geometry: Geometry
}

struct Properties: Decodable {
    let markerColor: String
    let name: String
}

struct Geometry: Decodable {
    let type: String
    let coordinates: [Double]
}
