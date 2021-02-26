
import UIKit
import CoreData

class PokemonInfoController: UIViewController {
    
    // MARK: - CoreData
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var favorite:[FavoriteCD]?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        
    }
    
    // MARK: - Properties
    
    var pokemon: Pokemon? {
        didSet {
            navigationItem.title = pokemon?.name?.capitalized
            imageView.image = pokemon?.image
            infoLabel.text = pokemon?.description
            infoView.pokemon = pokemon
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let infoView: InfoView = {
        let view = InfoView()
        view.configureViewForInfoController()
        return view
    }()
    
    lazy var addFavButton: UIView = {
        let view = UIButton(type: .system)
        view.backgroundColor = .mainPink()
        view.setTitle("Add to favorites", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        view.addTarget(self, action: #selector(addFavoriteItem), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
       
    }()
    
    // MARK: Selectors
    
    @objc func addFavoriteItem(){

        let newFavorite = FavoriteCD(context: self.context)

        newFavorite.nameFav = navigationItem.title
        
        try! self.context.save()

    }
    
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 44, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 44, paddingLeft: 16, paddingBottom: 0, paddingRight: 4, width: 0, height: 0)
        infoLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        view.addSubview(infoView)
        infoView.anchor(top: infoLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)

        view.addSubview(addFavButton)
        addFavButton.anchor(top: view.centerYAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 50)

    }
    
}
