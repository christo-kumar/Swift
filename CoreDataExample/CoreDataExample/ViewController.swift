//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Christo Kumar on 18/04/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context: NSManagedObjectContext?
    var backgroundContext: NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.backgroundContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
    }
    
    func create() {
        let newItem = ToDoListItem(context: self.context!)
        newItem.name = "Some Name"
        newItem.createdAt = Date()
        try? backgroundContext?.save()
    }
    
    func retrieve() {
        var items: [ToDoListItem] = [ToDoListItem]()
        items = try! context?.fetch(ToDoListItem.fetchRequest()) as! [ToDoListItem]
        for item in items {
            print(item.name!)
        }
        
        //OR Retrive via NSFetchResultController
    }
    
    func update(item: ToDoListItem, withName newName: String) {
        item.name = newName
        try? backgroundContext?.save()
    }
    
    func delete(item: ToDoListItem) {
        backgroundContext?.delete(item)
    }
}

extension ViewController: NSFetchedResultsControllerDelegate {
    
    func configureFetchResultController() {
        lazy var fetchedResultsController: NSFetchedResultsController<ToDoListItem> = {
              let fetchRequest = NSFetchRequest<ToDoListItem>(entityName:"ToDoListItem")
              let controller = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                          managedObjectContext: context!,
                                                          sectionNameKeyPath: nil, cacheName: nil)
              //controller.delegate = self
              
              do {
                  try controller.performFetch()
              } catch {
                  let nserror = error as NSError
                  fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
              }
              
              return controller
          }()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        //tableView.reloadData()
    }
}

