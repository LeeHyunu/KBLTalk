//
//  NPicker.swift
//  KBLTalk
//
//  Created by NICE_hwlee on 15/04/2019.
//  Copyright © 2019 KBL. All rights reserved.
//
import UIKit

class NPicker : UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    var mArrays: Array<String>?
    var mSelectedValues: String = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mArrays?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mArrays?[row] ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mSelectedValues = mArrays?[row] ?? ""
    }
    
    func setFrame(_ sizeRect: CGRect) {
        self.frame = sizeRect
    }
    
    func setArrays(_ arrays: Array<String>) {
        self.mArrays = arrays
        if arrays.count > 0 {
            mSelectedValues = arrays[0]
        }
    }
}
