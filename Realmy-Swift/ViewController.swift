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

    // Realm denetleyicisini tanımlayın
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addDB()
        getDB()
        //deleteDB()
        
    }
    
    //  Veritabanına ekle
    
    func addDB () {
        
        let dbUser = User()
        dbUser.email = "serkanmalagic@hotmail.com"
        dbUser.name = "Serkan Mehmet"
        
        try! realm.write {
            realm.add( dbUser )
            print("db insert successfull")
        }
        
    }
    
    //  Veritabanından getir
    
    func getDB () {
        
        let usersDB = realm.objects(User.self)
        
        for item in usersDB {
            print( "userId --- \( item.userId )")
            print( "name ----- \( item.name ) \n")
        }
        
    }
    
    //  Veritabanından sil
    
    func deleteDB () {
        
        let userDB = realm.objects( User.self )
        realm.delete( userDB )

    }

}

