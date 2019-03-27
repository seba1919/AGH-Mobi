//
//  ModuleDetailsViewController.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit
import Charts
import Hue
class ModuleDetailsViewController: SyllabusViewController, SyllabusViewControllerProtocol,ChartViewDelegate{
    var module:Module?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ectsLabel: UILabel!
    @IBOutlet weak var classesChart: PieChartView!
    @IBOutlet weak var teacherLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        classesChart.noDataText="Brak Danych"
        classesChart.delegate=self
        self.loadData()
        // Do any additional setup after loading the view.
    }
    func loadData(){
        if let module=module{
            titleLabel.text=module.name
            ectsLabel.text="\(module.ectsPoints ?? 0) ECTS"
            teacherLabel.text=module.moduleOwner?.getDescription()
            createClassesChart(withData: module)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createClassesChart(withData module:Module){
        
        guard let activities=module.moduleActivities else {return}
        var dataEntries:[PieChartDataEntry]=[]
        for i in 0..<activities.count {
            if let hours=activities[i].hours, let name=activities[i].type{
                let newName=name.replacingOccurrences(of: "Ćwiczenia", with: "Ćw.")
                let dataEntry = PieChartDataEntry(value: Double(hours), label: newName)
                dataEntries.append(dataEntry)
            }
        }
        
        let pieChartDataSet=PieChartDataSet(values: dataEntries, label: "")
        
        pieChartDataSet.colors=AGHColours.getArrayOfAGHColours(count: dataEntries.count)
     
        let pieChartData=PieChartData(dataSet: pieChartDataSet)
        classesChart.chartDescription?.enabled=false
        classesChart.drawHoleEnabled=false
        classesChart.legend.enabled=false
        
        classesChart.data=pieChartData
        
        
       
    }
    
  
    func relodData() {
       // tableView.reloadData()
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        if let data=entry as? PieChartDataEntry, let activities=module?.moduleActivities,let dataSet = chartView.data?.dataSets[ highlight.dataSetIndex] {
            let index=dataSet.entryIndex( entry: entry)
            let detailDescription=activities[index]
            print(detailDescription)
            self.performSegue(withIdentifier: "ShowDetailsOfActivity", sender: detailDescription)
            
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC=segue.destination as? ModuleActivityViewController{
            detailVC.moduleDetails=sender as? ModuleActivity
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
