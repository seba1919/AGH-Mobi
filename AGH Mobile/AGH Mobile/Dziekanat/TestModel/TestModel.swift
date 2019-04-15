//
//  TestModel.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 09/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation

final class TestModel : Model {
    func getGrades() -> Grades {
        let ex1 = Course(
            grades: [Grade(formOfClasses: "Ćwiczenia audytoryjne", term1: 3.5, term2: nil, term3: nil, issuedBy: "dr inż. Maciej Gierdziewicz", type: CourseType.Retake), Grade(formOfClasses: "Egzamin", term1: 5.0, term2: nil, term3: nil, issuedBy: "dr hab. Konrad Kułaowski", type: CourseType.Retake)], courseName: "Algorytmy i struktury danych", ects: 4, finalGrade: 4.5)
        
        let ex2 = Course(
            grades: [Grade(formOfClasses: "Ćwiczenia laboratoryjne", term1: 4.0, term2: nil, term3: nil, issuedBy: "dr Beata Ostachowicz", type: CourseType.Retake), Grade(formOfClasses: "Egzamin", term1: 3.0, term2: nil, term3: nil, issuedBy: "dr hab. Tomasz Ślęzak", type: CourseType.Retake)], courseName: "Fizyka 2", ects: 5, finalGrade: 3.5)
        
        let ex3 = Course(
            grades: [Grade(formOfClasses: "Ćwiczenia audytoryjne", term1: 2.0, term2: 2.0, term3: 3.5, issuedBy: "dr inż. Przemysław Syrek", type: CourseType.Retake), Grade(formOfClasses: "Egzamin", term1: nil, term2: nil, term3: 2.0, issuedBy: "prof. dr hab. inź. Zbigniew Galias", type: CourseType.Retake)], courseName: "Teoria Obwodów 1", ects: 6, finalGrade: 2.0)
        
        return Grades(courses: [ex1, ex2, ex3], avgSem: nil, avgYear: nil)
    }
}
