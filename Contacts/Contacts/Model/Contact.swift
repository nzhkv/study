//
//  Contact.swift
//  Contacts
//
//  Created by Nikolay Zhukov on 03.06.2022.
//

protocol ContactProtocol {
    var title: String { get set }
    var phone: String { get set }
}

struct Contact: ContactProtocol {
    var title: String
    var phone: String
}



