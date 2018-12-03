//
//  ColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Oniel Rosario on 11/30/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    private var colors = Crayon.allTheCrayons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,
            let indexpath = myTableView.indexPathForSelectedRow else {fatalError("nil segue")}
        destination.color = colors[indexpath.row]
    }
    
    
}

extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let color = colors[indexPath.row]
        cell.textLabel?.text = color.name
        cell.detailTextLabel?.text = color.hex
        cell.backgroundColor = color.color()
        return cell
    }
}
