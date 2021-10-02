//
//  TextFieldCell.swift
//  AppGraficas
//
//  Created by Anahi Rojas on 02/10/21.
//

import UIKit

class TextFieldCell: UITableViewCell {

    @IBOutlet var nombreTextField: UITextField!
    
    static let identifier = "TextFieldCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TextFieldCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
