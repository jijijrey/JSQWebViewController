//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://www.jessesquires.com/JSQWebViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQWebViewController
//
//
//  License
//  Copyright (c) 2015 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import UIKit
import JSQWebViewController

final class ViewController: UITableViewController {

    let url = URL(string: "http://www.indeed.com/viewjob?jk=de99d5613aa6c9c4&qd=TMJEuGUTtA_cCP5JNY-yVh9UhN2N9Y98lPOAd5QYcRuHwoDeVrOcg_iY2HdHiwQMsN0BVYVqAr9lvBFCALtmbYMF-ETwiDM7-r8tCBj781k&indpubnum=3635912176618288&atk=1bl01pljm0n3r6kb")!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = true
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.row == 2 {
            return
        }

        let webVC = WebViewController(url: url)

        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(webVC, animated: true)

        case 1:
            let nav = UINavigationController(rootViewController: webVC)
            present(nav, animated: true, completion: nil)

        default: break
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webViewController = segue.destination as? WebViewController
        webViewController?.urlRequest = URLRequest(url: url)
    }
}
