//
//  DatePicker.swift
//  CustomPickerDate
//
//  Created by Ботурбек Имомдодов on 02/07/23.
//

import Foundation
import UIKit

class DatePicker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    private var days = [Int]()
    private var months = [Int]()
    private var years = [Int]()
    var inputView: UIView {
        return pickerView
    }
    override init() {
        super.init()
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        setup(year: year, month: month)
        pickerView.selectRow(years.count - 10, inComponent: 2, animated: false)
    }
    func setup(year:Int, month:Int){
        years.removeAll()
        months.removeAll()
        days.removeAll()
        for i in (year - 100) ... year{
            years.append(i)
        }
        for i in 1 ... 12 {
            months.append(i)
        }
        guard let daysCount = numberOfDaysInMonth(month: month, year: year)  else {return}
        for i in 1 ... daysCount{
            days.append(i)
        }
        pickerView.reloadComponent(0)
    }
    func numberOfDaysInMonth(month: Int, year: Int) -> Int? {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: year, month: month)
        
        guard let date = calendar.date(from: dateComponents) else {
            return nil
        }
        
        let range = calendar.range(of: .day, in: .month, for: date)
        return range?.count
    }
    
    // MARK: - UIPickerViewDelegate & DateSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return days.count
        case 1:
            return months.count
        case 2:
            return years.count
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return String(days[row])
        case 1:
            return String(months[row])
        case 2:
            return String(years[row])
        default:
            return "?"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component != 0 {
            setup(year: years[pickerView.selectedRow(inComponent: 2)], month: months[pickerView.selectedRow(inComponent: 1)])
        }
    }
    
}
