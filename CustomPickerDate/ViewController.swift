//
//  ViewController.swift
//  CustomPickerDate
//
//  Created by Ботурбек Имомдодов on 02/07/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var date: UITextField!
    let datePicker = DatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        date.inputView = datePicker.inputView
        // Do any additional setup after loading the view.
    }
}

