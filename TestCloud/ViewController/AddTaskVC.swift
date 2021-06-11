//
//  AddTaskVC.swift
//  TestCloud
//
//  Created by Tuan Le on 11/06/2021.
//

import UIKit

class AddTaskVC: UIViewController {

    @IBOutlet weak var tftName: UITextField!
    @IBOutlet weak var tftDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTask(_ sender: Any) {
        guard let nameTask = tftName.text else {return}
        guard let descTask = tftDesc.text else {return}
        saveTask(nameTask: nameTask, descTask: descTask)
    }
    
    func saveTask(nameTask: String, descTask: String) {
        let task = Task(context: AppDelegate.viewContext)
        task.taskName = nameTask
        task.taskDesc = descTask
        do {
            try AppDelegate.viewContext.save()
            let alert = UIAlertController(title: "Success", message: "Add Task Success", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                self.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
        } catch {
            let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                self.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    

}
