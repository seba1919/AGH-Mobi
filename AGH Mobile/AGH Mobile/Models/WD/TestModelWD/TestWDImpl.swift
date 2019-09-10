//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

final class TestWDImpl: ModelWD {
    
    func getStudyProgress() -> [StudyProgress] {
        
        let sp1 = StudyProgress(academicYear: "2016/2017",
                                studiesYear: "I",
                                term: "1",
                                type: "Z",
                                decisionDate: "01.10.2016",
                                fromDate: "01.10.2016",
                                untilDate: "",
                                studentStatus: "wpis normalny",
                                reason: "")
        
        return [sp1]
    }
    
    func getScholarshipInfo() -> ScholarshipInfo {
        
        return ScholarshipInfo()
    }
    
    func getPersonalInfo() -> PersonalInfo {
        
        return PersonalInfo(albumNr: 293268,
                            fullName: "Sebastian Wiatrzyk",
                            faculty: "Inżynierii Metali i Informatyki Przemysłowej",
                            fieldOfStudy: "Informatyka Stosowana",
                            specialty: "",
                            formOfStudies: "stacjonarne",
                            studyDegree: "pierwszego stopnia",
                            educationProfile: "ogólnoakademicki",
                            fieldOfStudyStatus: "",
                            fieldOfStudyInfo: "Niepłatny",
                            studiesStartDate: "01.10.2016",
                            studiesStartDateAGH: "01.10.2016")
    }
    
    func getScheduleForDays(amount: Int) -> [DaySchedule] {
        let day1 = DaySchedule(date: "15.04.2019",
                               entries: [TimetableEntry(from: "11:30",
                                                        until: "13:00",
                                                        course: "Marketing internetowy",
                                                        lecturer: "dr inż. Tomasz Kargul",
                                                        classroom: "B-5 - s. 702",
                                                        formOfClasses: "ĆL"),
                                         TimetableEntry(from: "15:00",
                                                        until: "16:30",
                                                        course: "CAD / CAM",
                                                        lecturer: "dr inż. Szczepan Witek",
                                                        classroom: "B-5 - s. 612",
                                                        formOfClasses: "ĆL")])
        
        let day2 = DaySchedule(date: "16.04.2019",
                               entries: [TimetableEntry(from: "08:00",
                                                        until: "09:30",
                                                        course: "CAD / CAM",
                                                        lecturer: "prof. dr hab. inż. Andriy Milenin",
                                                        classroom: "B-5 - s. 110",
                                                        formOfClasses: "W"),
                                         TimetableEntry(from: "09:45",
                                                        until: "11:15",
                                                        course: "Logistyka w hutnictwie",
                                                        lecturer: "dr inż. Krzysztof Sołek",
                                                        classroom: "B-5 - s. 104",
                                                        formOfClasses: "W"),
                                         TimetableEntry(from: "15:00",
                                                        until: "16:30",
                                                        course: "Marketing internetowy",
                                                        lecturer: "dr inż. Paweł Drożdż",
                                                        classroom: "B-5 - s. 102",
                                                        formOfClasses: "W")])
        
        let day3 = DaySchedule(date: "17.04.2019 ",
                               entries: [TimetableEntry(from: "08:00",
                                                        until: "09:30",
                                                        course: "Internet Engineering",
                                                        lecturer: "dr hab. inż. Łukasz Rauch",
                                                        classroom: "B-5 - s. 110",
                                                        formOfClasses: "W"),
                                         TimetableEntry(from: "11:30",
                                                        until: "13:00",
                                                        course: "Systemy Wbudowane",
                                                        lecturer: "dr hab. inż. Łukasz Rauch",
                                                        classroom: "B-4 - s. 122",
                                                        formOfClasses: "W")])
            
        return [day1, day2, day3]
    }
    
    func getGrades() -> Grades {
        let ex1 = Course(grades: [Grade(formOfClasses: "Ćwiczenia audytoryjne",
                                        term1: 3.5,
                                        term2: nil,
                                        term3: nil,
                                        issuedBy: "dr inż. Maciej Gierdziewicz",
                                        type: CourseType.retake),
                                  Grade(formOfClasses: "Egzamin",
                                        term1: 5.0,
                                        term2: nil,
                                        term3: nil,
                                        issuedBy: "dr hab. Konrad Kułaowski",
                                        type: CourseType.retake)],
                         courseName: "Algorytmy i struktury danych",
                         ects: 4,
                         finalGrade: 4.5)
        
        let ex2 = Course(grades: [Grade(formOfClasses: "Ćwiczenia laboratoryjne",
                                        term1: 4.0,
                                        term2: nil,
                                        term3: nil,
                                        issuedBy: "dr Beata Ostachowicz",
                                        type: CourseType.retake),
                                  Grade(formOfClasses: "Egzamin",
                                        term1: 3.0,
                                        term2: nil,
                                        term3: nil,
                                        issuedBy: "dr hab. Tomasz Ślęzak",
                                        type: CourseType.retake)],
                         courseName: "Fizyka 2",
                         ects: 5,
                         finalGrade: 3.5)
        
        let ex3 = Course(grades: [Grade(formOfClasses: "Ćwiczenia audytoryjne",
                                        term1: 2.0,
                                        term2: 2.0,
                                        term3: 3.5,
                                        issuedBy: "dr inż. Przemysław Syrek",
                                        type: CourseType.retake),
                                  Grade(formOfClasses: "Egzamin",
                                        term1: nil,
                                        term2: nil,
                                        term3: 2.0,
                                        issuedBy: "prof. dr hab. inź. Zbigniew Galias",
                                        type: CourseType.retake)],
                         courseName: "Teoria Obwodów 1",
                         ects: 6,
                         finalGrade: 2.0)
        
        return Grades(courses: [ex1, ex2, ex3],
                      avgSem: nil,
                      avgYear: nil)
    }
}
