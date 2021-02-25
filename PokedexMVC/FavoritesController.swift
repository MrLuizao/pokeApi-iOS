

import UIKit
import CoreData

private let reuseIdentifier = "cell"

//class FavoritesController: UIViewController{
class FavoritesController: UITableViewController{
    
    // MARK: - CoreData
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //var favorite = [Pokemon]()
    var favorite:[FavoriteCD]?
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .white
        navigationItem.title = "Favorites"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        //fetchPokemon()
        getDataFromCore()
        
    }
        

    //MARK: - Fetch Data

    func getDataFromCore(){
        do{
            self.favorite = try context.fetch(FavoriteCD.fetchRequest())

            DispatchQueue.main.async {
                //self.favorite = favorite
                self.tableView.reloadData()
            }

        }catch{
            print("Error al recuperar datos")
        }
    }
    
//        func fetchPokemon() {
//            Service.shared.fetchPokemon { (favorite) in
//                DispatchQueue.main.async {
//                    self.favorite = favorite
//                    self.tableView.reloadData()
//                }
//            }
//        }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorite!.count
    }

    override func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = favorite![indexPath.row].nameFav
        return cell
    }
        
}






