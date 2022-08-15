import UIKit
import SceneKit
import ARKit


class LoginViewController: UIViewController{
    
    let apiServices: ApiServicesProtocol
    let baseBackground: UIView
    let mainTitle: UILabel
    let loginField: BaseField
    let passwordField: BaseField
    let buttonLogin: UIButton
    let errorLabel: UILabel
    let router: Router?
    weak var userModel: UserModel!
    weak var goodModel: GoodModel!
    var appViewController: AppViewController?
    
    init(
        apiServices: ApiServicesProtocol,
        baseBackground: UIView,
        mainTitle: UILabel,
        loginField: BaseField,
        passwordField: BaseField,
        buttonLogin: UIButton,
        errorLabel: UILabel,
        router: Router,
        userModel: UserModel,
        goodModel: GoodModel
    ) {
        self.apiServices = apiServices
        self.baseBackground = baseBackground
        self.mainTitle = mainTitle
        self.loginField = loginField
        self.passwordField = passwordField
        self.buttonLogin = buttonLogin
        self.errorLabel = errorLabel
        self.router = router
        self.userModel = userModel
        self.goodModel = goodModel
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func login(_ sender: UITapGestureRecognizer) {
        
        let LoginText = self.loginField.text
        let PasswordText = self.passwordField.text
        let ErrorLabel = self.errorLabel
        
        let appViewController = AppViewController(
            baseBackground: self.baseBackground,
            goodModel: self.goodModel!
        )
        
        self.router!.autorization(
            appViewController: appViewController,
            login: LoginText!,
            password: PasswordText!,
            errorLabel: ErrorLabel,
            userModel: self.userModel!
        )
            
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
                
        self.view.addSubview(baseBackground)
                
        NSLayoutConstraint.activate([
            baseBackground.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            baseBackground.heightAnchor.constraint(equalToConstant: self.view.frame.height),
            baseBackground.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            baseBackground.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        //set title
        
        baseBackground.addSubview(self.mainTitle)

        NSLayoutConstraint.activate([
            mainTitle.widthAnchor.constraint(equalToConstant: 550),
            mainTitle.heightAnchor.constraint(equalToConstant: 150),
            mainTitle.centerXAnchor.constraint(equalTo: baseBackground.centerXAnchor),
            mainTitle.centerYAnchor.constraint(equalTo: baseBackground.centerYAnchor, constant: -100)
        ])
        
        //set login field
       
        baseBackground.addSubview(self.loginField)

        NSLayoutConstraint.activate([
            loginField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 50),
            loginField.heightAnchor.constraint(equalToConstant: 50),
            loginField.centerXAnchor.constraint(equalTo: self.mainTitle.centerXAnchor),
            loginField.centerYAnchor.constraint(equalTo: self.mainTitle.bottomAnchor, constant: 50)
        ])
        
        //set password field
        
        baseBackground.addSubview(self.passwordField)

        NSLayoutConstraint.activate([
            passwordField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 50),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.centerXAnchor.constraint(equalTo: self.loginField.centerXAnchor),
            passwordField.centerYAnchor.constraint(equalTo: self.loginField.bottomAnchor, constant: 50)
        ])
        
        //set button
        
        let guestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(
                self.login(_:)
            )
        )
        
        self.buttonLogin.addGestureRecognizer(guestureRecognizer)
        
        baseBackground.addSubview(self.buttonLogin)

        NSLayoutConstraint.activate([
            buttonLogin.widthAnchor.constraint(equalToConstant: self.view.frame.width - 50),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),
            buttonLogin.centerXAnchor.constraint(equalTo: self.passwordField.centerXAnchor),
            buttonLogin.centerYAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 50)
        ])
        
        //set error label
        
        baseBackground.addSubview(self.errorLabel)

        NSLayoutConstraint.activate([
            errorLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width - 50),
            errorLabel.heightAnchor.constraint(equalToConstant: 50),
            errorLabel.centerXAnchor.constraint(equalTo: self.buttonLogin.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: self.buttonLogin.bottomAnchor, constant: 50)
        ])
         
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan in LoginViewController")
    }
    
}

