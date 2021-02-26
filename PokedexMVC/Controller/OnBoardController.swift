
import UIKit


class OnBoardController: UIViewController {
    
    //MARK: -> Props
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "onBoardin")
        return iv
    }()
    
    let textLabel: UILabel = {
        let textData = UILabel()
        textData.textColor = .mainPink()
        textData.text = "Provider Data"
        return textData
    }()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    //MARK: -> Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurations()
        
    }
    
    
    //MARK: -> Config

    private func configurations(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(skipOnBoarding))
        navigationItem.rightBarButtonItem?.tintColor = .mainPink()
                
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 600, height: 250)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(textLabel)
        textLabel.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 12, paddingLeft: 150, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)


    }
    
    //MARK: -> selectors
    
    @objc func skipOnBoarding(){
        print("Acá ejecuta Core.shared.setIsNotNewUser()")
        Core.shared.setIsNotNewUser()
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
