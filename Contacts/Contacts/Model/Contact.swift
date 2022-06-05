//
//  Contact.swift
//  Contacts
//
//  Created by Nikolay Zhukov on 03.06.2022.
//

import Foundation

protocol ContactProtocol {
    var title: String { get set }
    var phone: String { get set }
}

protocol ContactStorageProtocol {
    func load() -> [ContactProtocol]
    func save(contacts: [ContactProtocol])
}

struct Contact: ContactProtocol {
    var title: String
    var phone: String
}

class ContactStorage: ContactStorageProtocol {
    private var storage = UserDefaults.standard
    private var storageKey = "contacts"
    
    private enum ContactKey: String {
        case title
        case phone
    }
    
    func load() -> [ContactProtocol] {
        var resultContact: [ContactProtocol] = []
        let contactsFromStrorage = storage.array(forKey: storageKey) as? [[String:String]] ?? []
        for contact in contactsFromStrorage {
            guard let title = contact[ContactKey.title.rawValue],
                  let phone = contact[ContactKey.phone.rawValue] else { continue }
            
            resultContact.append(Contact(title: title, phone: phone))
        }
        return resultContact
    }
    
    func save(contacts: [ContactProtocol]) {
        var arrayForStorage: [[String:String]] = []
        contacts.forEach { contact in
            var newElementForStorsge: Dictionary<String, String> = [:]
            newElementForStorsge[ContactKey.title.rawValue] = contact.title
            newElementForStorsge[ContactKey.phone.rawValue] = contact.phone
            arrayForStorage.append(newElementForStorsge)
        }
        storage.set(arrayForStorage, forKey: storageKey)
    }
}

