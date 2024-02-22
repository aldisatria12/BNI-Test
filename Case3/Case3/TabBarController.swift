//
//  TabBarController.swift
//  Case3
//
//  Created by Aldi Mahotma on 22/02/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initTabs()
    }
    
    func initTabs() {
        let vc1Router = HomepageRouter.startExecution()
        let vc1 = vc1Router.entry!
        let vc2Router = LineRouter.startExecution()
        let vc2 = vc2Router.entry!
        
        vc1.tabBarItem.image = UIImage(systemName: "chart.pie.fill")
        vc2.tabBarItem.image = UIImage(systemName: "chart.line.uptrend.xyaxis")
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        
        setViewControllers([nav1, nav2], animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
