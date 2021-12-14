//
//  ViewController.swift
//  Realmy-Swift
//
//  Created by Serkan Mehmet Malagiç on 12.12.2021.
//

import UIKit
import RealmSwift

class User: Object {
    @objc dynamic var userId = UUID()
    @objc dynamic var name : String? = ""
    @objc dynamic var email : String? = ""
}

class ViewController: UIViewController {

    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    // Realm denetleyicisini tanımlayın
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    //  Veritabanına ekle
    
    func addDB () {
        
        let dbUser = User()
        dbUser.email = "serkanmalagic@hotmail.com"
        dbUser.name = "Serkan Mehmet"
        
        try! realm.write {
            realm.add( dbUser )
            infoLbl.text = "Database INSERTED"
        }
        
    }
    
    //  Veritabanından getir
    
    func getDB () {
        
        let usersDB = realm.objects(User.self)
        
        for item in usersDB {
            print( "userId --- \( item.userId )")
            print( "name ----- \( item.name ) \n")
        }
        infoLbl.text = "Database SELECTED"

    }
    
    //  Veritabanından sil
    
    func deleteDB () {
        
    
        let userDB = realm.objects(User.self)
        
        try! realm.write {
            realm.delete(userDB)
        }
        infoLbl.text = "Database DELETED"

    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            addDB()
        case 1:
            getDB()
        case 2:
            deleteDB()
        default:
            break
        }
    }

}

