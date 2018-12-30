//
//  ViewController.swift
//  MVVMProject
//
//  Created by MACBOOK PRO RETINA on 25/12/2018.
//  Copyright © 2018 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var phoneNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel(viewDelegate: self)
        let nib = UINib(nibName: "CustomItemTableViewCell", bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: "itemCell")
        itemTableView.dataSource = self
        itemTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func AddItemAction(_ sender: UIButton) {
        viewModel?.onItemAddClick(phoneName: phoneNameTextField.text!, phoneNumber: phoneNumberTextField.text!)
    }
    

}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "itemCell") as! CustomItemTableViewCell
        cell.setupDataFromModel(model: viewModel!.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
}

extension ViewController: reloadTableViewDelegate {
    func reloadTableView(index: Int) {
        phoneNameTextField.text = ""
        phoneNumberTextField.text = ""
        itemTableView.beginUpdates()
        itemTableView.insertRows(at: [IndexPath(row: index-1,section: 0)], with: .automatic)
        itemTableView.endUpdates()
        let alert = UIAlertController(title: "", message: "Contact Added Successfully", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

