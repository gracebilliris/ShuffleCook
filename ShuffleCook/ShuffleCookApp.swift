//
//  ShuffleCookApp.swift
//  ShuffleCook
//
//  Created by Grace Billiris on 13/2/2023.
//

import SwiftUI
import Foundation

func load<T: Decodable>(_ filename: String) -> T {
     let data: Data

     guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
         else {
             fatalError("Couldn't find \(filename) in main bundle.")
     }

     do {
         data = try Data(contentsOf: file)
     } catch {
         fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
     }

     do {
         let decoder = JSONDecoder()
         return try decoder.decode(T.self, from: data)
     } catch {
         fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
     }
 }

var recipes: [Recipe] = load("recipeData.json")

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let shakeGestureHandler = ShakeGestureHandler()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Create the main window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let contentView = MainView()
            .environmentObject(Model())
        
        // Set the main view as the root view controller
        window?.rootViewController = UIHostingController(rootView: contentView)
        window?.makeKeyAndVisible()
        
        return true
    }
}

class ShakeGestureHandler: UIResponder {
    override init() {
        super.init()
        becomeFirstResponder()
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
               let window = appDelegate.window {
                let shuffleViewController = UIHostingController(rootView: ShuffleView())
                window.rootViewController?.present(shuffleViewController, animated: true, completion: nil)
            }
        }
    }
}

@main
struct ShuffleCookApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    let shakeGestureHandler = ShakeGestureHandler()
    
    @StateObject var model = Model()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(model)
                .onAppear {
                    model.recipes = load("recipeData.json")
                }
        }
    }
}
