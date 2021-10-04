//
//  SendButtonCell.swift
//  AppGraficas
//
//  Created by Anahi Rojas on 03/10/21.
//

import UIKit

protocol SendButtonCellDelegate: AnyObject  {
    func didTapSendButton()
}

class SendButtonCell: UITableViewCell {
    
    weak var delegate: SendButtonCellDelegate?
    
    @IBOutlet var SendButton: UIButton!
    @IBAction func didTapSendButton(){
        delegate?.didTapSendButton()
    }
    
    static let identifier = "SendButtonCell"

    static func nib() -> UINib {
        return UINib(nibName: "SendButtonCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
