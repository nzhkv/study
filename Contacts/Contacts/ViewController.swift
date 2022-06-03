//
//  ViewController.swift
//  Contacts
//
//  Created by Nikolay Zhukov on 03.06.2022.
//

import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        var cell: UITableViewCell

        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") {
            print("используем старую ячейку с индексом \(indexPath.row)")
            cell = reuseCell
        } else {
            print("создаем новую ячейку с индексом \(indexPath.row)")
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        }

        configure(cell: &cell, for: indexPath)
        return cell
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = contacts[indexPath.row].title
        configuration.secondaryText = contacts[indexPath.row].phone
        cell.contentConfiguration = configuration
    }
}



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContacts()
    }
    
    private var contacts = [ContactProtocol]()
    
    private func loadContacts() {
        contacts.append(Contact(title: "Саня", phone: "+79281213456"))
        contacts.append(Contact(title: "Ваня", phone: "+79288363419"))
        contacts.append(Contact(title: "Игорек", phone: "+79183755907"))
        contacts.sort{ $0.title < $1.title}
    }
}

