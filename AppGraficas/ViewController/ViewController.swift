//
//  ViewController.swift
//  AppGraficas
//
//  Created by Anahi Rojas on 02/10/21.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore

class ViewController: UIViewController{

    let selfieCell = SelfieCell()
    var selectedImage: UIImage?
    let textfieldCell = TextFieldCell()
    var name: String = ""
    let buttonCell = SendButtonCell()
    
    private let storage = Storage.storage().reference()
    let database = Firestore.firestore()
    
   


    private let tableView: UITableView =  {
        let table = UITableView()
        
        table.register(TextFieldCell.nib(), forCellReuseIdentifier: TextFieldCell.identifier)
        table.register(SelfieCell.nib(), forCellReuseIdentifier: SelfieCell.identifier)
        table.register(SendButtonCell.nib(), forCellReuseIdentifier: SendButtonCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)

    }

    func saveData(text: String, image: Data) {
        let docRef = database.document("appGraficas/imagenUsuario")
        docRef.setData(["Usuario": text, "Imagen": image])
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
            cell.nombreTextField.delegate = self
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SelfieCell.identifier, for: indexPath) as! SelfieCell
            cell.delegate = self
            cell.configureImage(with: selectedImage ?? UIImage.init(imageLiteralResourceName: "SelfieIcon"))
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SendButtonCell.identifier, for: indexPath) as! SendButtonCell
        cell.delegate = self
        return cell
        
    }
    
}

extension ViewController: SelfieCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    func didTapButton() {

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
        
        selectedImage = takenImage
        
        let selectedImageRef = storage.child("image.jpg")
        //Storage
        guard let imageData = takenImage.pngData() else {
            return
        }

        storage.child("images/file.png").putData(imageData, metadata: nil) { _, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
        }
        tableView.reloadData()
    }
    
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}


extension ViewController: SendButtonCellDelegate {
   
    func didTapSendButton(){
        createAlert(title: "Datos Guardados", message: name)
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        name = textField.text ?? ""
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        name = ""
    }
}
