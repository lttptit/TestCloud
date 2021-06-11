//
//  ViewController.swift
//  TestCloud
//
//  Created by Tuan Le on 11/06/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblTask: UITableView!
    let TASK_CELL = "TaskCell"
    var taskList: [Task] = []
    var enteredTask = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupData()
    }
    
    func setupData() {
        taskList = Task.fetchAll()
        tblTask.reloadData()
    }
    
    func setupUI() {
        tblTask.delegate = self
        tblTask.dataSource = self
        tblTask.register(UINib(nibName: TASK_CELL, bundle: nil), forCellReuseIdentifier: TASK_CELL)
    }

    @IBAction func addTask(_ sender: Any) {
        let vc = AddTaskVC()
        present(vc, animated: true, completion: nil)
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tblTask.dequeueReusableCell(withIdentifier: TASK_CELL) as? TaskCell {
            cell.lblNameTask.text = taskList[indexPath.row].taskName
            cell.lblDescTask.text = taskList[indexPath.row].taskDesc
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tblTask.frame.height/7
    }
    
}
