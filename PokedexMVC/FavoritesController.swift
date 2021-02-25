

import UIKit

private let reuseIdentifier = "cell"


//class FavoritesController: UIViewController{
class FavoritesController: UITableViewController{

    var favorite = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Favorites"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        fetchPokemon()
        
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorite.count
    }
    
    override func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = favorite[indexPath.row].name
        return cell
    }
    
    func fetchPokemon() {
        Service.shared.fetchPokemon { (favorite) in
            DispatchQueue.main.async {
                self.favorite = favorite
                self.tableView.reloadData()
            }
        }
    }
    

}
