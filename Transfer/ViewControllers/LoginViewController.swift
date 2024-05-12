//
//  ViewController.swift
//  Transfer
//
//  Created by Денис Александров on 10.05.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    
    var user: User?
    var person: Person?
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        
        if let welcomeNavController = tabBarController.viewControllers?.first as? UINavigationController,
           let welcomeVC = welcomeNavController.topViewController as? WelcomeViewController {
            welcomeVC.user = user?.username ?? "Default Username"
            welcomeVC.person = person?.firstName ?? "Default firstName"
        }
        
        if let informationNavController = tabBarController.viewControllers?[1] as? UINavigationController,
           let informationVC = informationNavController.topViewController as? InformationViewController {
            informationVC.person = person?.firstName ?? "Default firstName"
            informationVC.lastPerson = person?.lastName ?? "Default lastName"
            informationVC.jobPerson = person?.job ?? "Default job"
            informationVC.positionPerson = person?.position ?? "Default position"
            informationVC.bioPerson = person?.bio ?? "Default bio"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan (touches, with: event)
        view.endEditing (true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newUser = User(username: "user", password: "password123")
        let newPerson = Person(
            firstName: "Denis",
            lastName: "Aleksandrov",
            job: "Flotenk",
            position: "SEO",
            bio: "родился в 1960 году в городе Мобил, штат Алабама, но детство провел в городке Робертсдейл. Мать будущего предпринимателя была фармацевтом, а отец — рабочим верфи. Кук мало рассказывал о своем детстве. Известна история о том, как он увидел расправу Ку- клукс-клана над негритянской семьей. Испугавшись, Тим крикнул, чтобы они остановились, но, приглядевшись, узнал в одном из участников действа местного священника и сбежал. Эта история, по словам предпринимателя, серьезно повлияла на его взгляды.")
        
        newUser.person = newPerson
        newPerson.user = newUser
        
        self.user = newUser
        self.person = newPerson
        
        usernameTextField.text = user?.username
        passwordTextField.text = user?.password
        passwordTextField.isSecureTextEntry = true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool{
        guard usernameTextField.text == user?.username, passwordTextField.text == user?.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return false
        }
        return true
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(String(describing: user?.username))")
        : showAlert(title: "Oops!", message: "Your password is \(String(describing: user?.password))")
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction (title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

