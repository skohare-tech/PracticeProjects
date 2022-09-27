import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase

class GoogleSignInViewController: UIViewController{
    @IBOutlet weak var indicator : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        
    
}
    func googleSignIn(){
        guard let clientID = FirebaseApp.app()?.options.clientID else{
            return
        }

        let config = GIDConfiguration(clientID: clientID)
       

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
           
            return
          }

          guard let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)
        }
    }
}
