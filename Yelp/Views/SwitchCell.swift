//
//  SwitchCell.swift
//  Yelp
//
//  Created by john on 2/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate {
    @objc optional func switchCellDidSwitchChanged(_ switchCell: SwitchCell, didChangeValue value: Bool)
}

class SwitchCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var switchCtrl: UISwitch!
    
    weak var delegate: SwitchCellDelegate?
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        delegate?.switchCellDidSwitchChanged?(self, didChangeValue: sender.isOn)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
