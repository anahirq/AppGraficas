//
//  SelfieCell.swift
//  AppGraficas
//
//  Created by Anahi Rojas on 02/10/21.
//

import UIKit

protocol SelfieCellDelegate: AnyObject  {
    func didTapButton()
}

class SelfieCell: UITableViewCell {
    
    weak var delegate: SelfieCellDelegate?
    
    @IBOutlet var imageViewContainer: UIImageView!
    
    @IBOutlet var cameraButton: UIButton!
    @IBAction func didTapButton(){
        delegate?.didTapButton()
    }
    
    
    static let identifier = "SelfieCell"
    
    
    static func nib() -> UINib {
        return UINib(nibName: "SelfieCell", bundle: nil)
    }

    override func layoutSubviews() {
        imageViewContainer.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
    }
    
    public func configureImage(with imageName: UIImage){
        imageViewContainer.image = imageName
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
