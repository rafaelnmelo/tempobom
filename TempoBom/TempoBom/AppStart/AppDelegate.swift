import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupBarAppearence()
        return true
    }
    
    func setupBarAppearence() {
        let barAppearance = UINavigationBarAppearance()
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        //BarButtons ItemColor
        UIBarButtonItem.appearance().tintColor = .white
        
        //Collapsed TitleColor
        barAppearance.titleTextAttributes = textAttributes
        
        //Large TitleColor
        barAppearance.backgroundColor = .systemOrange
        barAppearance.largeTitleTextAttributes = textAttributes
        
        if #available(iOS 13, *) {
            UINavigationBar.appearance().standardAppearance = barAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

