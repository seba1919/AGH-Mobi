//
//  SyllabusDataSource.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 06.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit

class SyllabusDataSource:NSObject {
    let language="pl"
    let year="2013-2014"
    func handleError(error:Error){
      print("Error Retriving Data")
    }
    func handleJSONerror(){
         print("Error retriving data!")
    }
    func delegateNotSet(){
        print("Error delegate is not set ")
    }
}
