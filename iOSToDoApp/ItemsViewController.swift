//
//  ItemsViewControllerViewController.swift
//  iOSToDoApp
//
//  Created by Michail Bondarenko on 10/3/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit

/*
class ItemsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
*/

import RealmSwift // <- Insert this

class ItemsViewController: UIViewController {
    let realm: Realm            // <- Insert this
    let items: Results<Item>    // <- Insert this
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let syncConfig = SyncConfiguration(user: SyncUser.current!, realmURL: Constants.REALM_URL)
        self.realm = try! Realm(configuration: Realm.Configuration(syncConfiguration: syncConfig, objectTypes:[Item.self]))
        self.items = realm.objects(Item.self).sorted(byKeyPath: "timestamp", ascending: false)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation


