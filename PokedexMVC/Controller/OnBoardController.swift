
//import Foundation

import UIKit


class OnBoardController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet var holderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.barTintColor = .white
//        navigationController?.navigationBar.barStyle = .default
//        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(skipOnBoarding))
        navigationItem.rightBarButtonItem?.tintColor = .mainPink()
        
    }
    
    //MARK: -> selectors
    
    @objc func skipOnBoarding(){
        print("Acá ejecuta Core.shared.setIsNotNewUser()")
        Core.shared.setIsNotNewUser()
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}