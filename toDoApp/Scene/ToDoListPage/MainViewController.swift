//
//  ViewController.swift
//  toDoApp
//
//  Created by Akın Aksoy on 5.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        view.backgroundColor = UIColor().setPurple1
        UINavigationBar.appearance().barTintColor = .green
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus" ), style: .done, target: self, action: #selector(goToCreateScenePage))
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        
    }

    @objc func goToCreateScenePage(){
        performSegue(withIdentifier: "goToCreateScenePage", sender: nil)
    }
    

}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoTableViewCell
        cell.TimeLabel.text = "22.02.2021 - 14.30"
        cell.titleLabel.text = "Go to Shopping"
        cell.toDoCheckbox.image = UIImage(systemName: "checkmark.square")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    
}
