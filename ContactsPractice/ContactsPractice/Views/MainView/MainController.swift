//
//  MainController.swift
//  ContactsPractice
//
//  Created by Oscar Alvarado on 12/10/24.
//

import Foundation

final class MainController {
    private let coreDataStack = CoreDataStack(modelName: "CoreDataDemo")
    
    func getContacts() -> [ContactModel] {
        let fetchRequest = ContactModel.fetchRequest()
        
        do {
            let contacts = try coreDataStack.context.fetch(fetchRequest)
            return contacts
        } catch {
            print("Fetch error: \(error.localizedDescription)")
        }
        
        return []
    }
    
    func saveContact(name: String, number: Int16, address: String) {
        let newContact = ContactModel(context: coreDataStack.context)
        
        newContact.id = UUID().uuidString
        newContact.name = name
        newContact.number = number
        newContact.address = address
        
        
        
        coreDataStack.save()
    }
    
    func removeContact(contact: ContactModel) {
        coreDataStack.context.delete(contact)
        coreDataStack.save()
    }
    
    
}
