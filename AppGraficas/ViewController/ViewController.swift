//
//  ViewController.swift
//  AppGraficas
//
//  Created by Anahi Rojas on 02/10/21.
//

import UIKit

class ViewController: UIViewController {
    func didPressButton(_ tag: Int) {
        
             print("I have pressed a button with a tag: ")
    }
    

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
        cell.configure(with: "SelfieIcon")
        cell.delegate = self
        
            return cell

    }
}

extension ViewController: SelfieCellDelegate {
    func didTapButton() {
        print("Button pressed")
    }
    
    
}
