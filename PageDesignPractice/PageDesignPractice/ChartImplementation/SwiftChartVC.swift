//
//  SwiftChartVC.swift
//  PageDesignPractice
//
//  Created by Admin on 04/02/22.
//

import UIKit
import SwiftChart

class SwiftChartVC: UIViewController {
    @IBOutlet weak var chartView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getChart()    }
    

    func getChart()
    {
        let chart = Chart(frame: CGRect(x: 0, y: 0, width: self.chartView.frame.width, height: self.chartView.frame.height))

        let series1 = ChartSeries([0, 6, 2, 8, 4, 7, 3, 10, 8])
        series1.color = ChartColors.yellowColor()
        series1.area = true

        let series2 = ChartSeries([1, 0, 0.5, 0.2, 0, 1, 0.8, 0.3, 1])
        series2.color = ChartColors.redColor()
        series2.area = true

        // A partially filled series
        let series3 = ChartSeries([9, 8, 10, 8.5, 9.5, 10])
        series3.color = ChartColors.purpleColor()

        chart.add([series1, series2, series3])
        
        self.chartView.addSubview(chart)
        
    }
   
}
