//
//  ViewController.swift
//  AppGraficas
//
//  Created by Anahi Rojas on 02/10/21.
//

import UIKit

class ViewController: UIViewController{

    

    private let tableView: UITableView =  {
        let table = UITableView()
        
        table.register(TextFieldCell.nib(), forCellReuseIdentifier: TextFieldCell.identifier)
        table.register(SelfieCell.nib(), forCellReuseIdentifier: SelfieCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       configureTableView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.identifier, for: indexPath) as! TextFieldCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SelfieCell.identifier, for: indexPath) as! SelfieCell
        cell.configureImage(with: #imageLiteral(resourceName: "SelfieIcon"))
        cell.delegate = self
        
            return cell

    }
}

extension ViewController: SelfieCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    func didTapButton() {
        print("Button pressed")
//        let cameraViewController = CameraVC()
//        cameraViewController.modalPresentationStyle = .overCurrentContext
//        present(cameraViewController, animated: true, completion: nil)
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let takenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        let selfieCell: SelfieCell = tableView.dequeueReusableCell(withIdentifier: SelfieCell.identifier) as! SelfieCell
        selfieCell.configureImage(with: #imageLiteral(resourceName: "card"))
        print("cambiar a tarjeta")
        tableView.reloadData()
    }
}
