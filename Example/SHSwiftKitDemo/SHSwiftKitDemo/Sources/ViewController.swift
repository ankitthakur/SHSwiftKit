import UIKit
import SHSwiftKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

		for filePath in SHFileManager.sharedInstance.systemDirectories {
			_ = SHFileManager.file(filePath)
		}

		print(SHFileManager.numberOfApps());
  }
}
