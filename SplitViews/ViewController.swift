import UIKit

class ViewController: UIViewController {

    let splView = UISplitViewController(style: .doubleColumn)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openAction(_ sender: Any) {
        splView.modalPresentationStyle = .fullScreen
        
        let controler1 = TablaViewController(style: .plain)
        controler1.delegado = self
        
        let controlador = UIViewController()
        controlador.title = "Home"
        controlador.view.backgroundColor = .purple
        
        splView.viewControllers = [
            UINavigationController(rootViewController: controler1),
            UINavigationController(rootViewController: controlador)
        ]
        self.present(splView, animated: true)
    }
    
}

extension ViewController: TablaViewProtocol {
    
    func didSelectRow(iIndex: Int) {
        let controladorX = UIViewController()
        controladorX.title = "Celda \(iIndex)"
        controladorX.view.backgroundColor = .darkGray
        guard let ultimo = splView.viewControllers.last as? UINavigationController else { return }
        ultimo.pushViewController(controladorX, animated: true)
    }
    
}
