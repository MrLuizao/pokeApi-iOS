
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
    
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
            button.backgroundColor = .mainPink()
            button.setTitle("Skip OnBoarding", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.addTarget(self, action: #selector(skipOnBoarding), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 5
            button.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        return button
       
    }()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    //MARK: -> Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurations()
        
    }
    
    
    //MARK: -> Config

    private func configurations(){
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .white

        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 600, height: 250)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(skipButton)
        skipButton.anchor(top: view.centerYAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 50)


    }
    
    //MARK: -> selectors
    
    @objc func skipOnBoarding(){
        
        Core.shared.setIsNotNewUser()
        navigationController?.dismiss(animated: true, completion: nil)

        return
    }
    
}
