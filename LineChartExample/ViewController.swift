//
//  ViewController.swift
//  LineChartExample
//
//  Created by Osian on 13/07/2017.
//  Copyright © 2017 Osian. All rights reserved.
//

import UIKit
import Charts // You need this line to be able to use Charts Library
class ViewController: UIViewController {

    @IBOutlet weak var txtTextBox: UITextField!
    @IBOutlet weak var chtChart: LineChartView!
    let months = ["Jan", "Feb", "Mar"]

    var numbers : [Double] = [10,30,20,25] //This is where we are going to store all the numbers. This can be a set of numbers that come from a Realm database, Core data, External API's or where ever else

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateGraph()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
   

    func updateGraph(){
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.

        
        
        //here is the for loop
        for i in 0..<numbers.count {

            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry

            lineChartEntry.append(value) // here we add it to the data set
        }

        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Engagement") //Here we convert lineChartEntry to a LineChartDataSet

        line1.colors = [NSUIColor.blue] //Sets the colour to blue


        let data = LineChartData() //This is the object that will be added to the chart

        data.addDataSet(line1) //Adds the line to the dataSet
        
        chtChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        chtChart.xAxis.granularity = 1
        chtChart.xAxis.labelPosition = .top

        // Set the x values date formatter
       
        
        chtChart.data = data //finally - it adds the chart data to the chart and causes an update

        chtChart.chartDescription?.text = "" // Here we set the description for the graph

    }



}


