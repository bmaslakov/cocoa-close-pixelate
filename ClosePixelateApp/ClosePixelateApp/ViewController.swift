import UIKit
import ClosePixelate

class ViewController: UIViewController {
    var config: (String, [PixelateLayer])!
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        let statbarHeight = UIApplication.shared.statusBarFrame.size.height
        let navbarHeight = self.navigationController!.navigationBar.frame.size.height
        let offset = statbarHeight + navbarHeight
        imageView.frame = CGRect(x: 0,
                                 y: offset,
                                 width: self.view.frame.width,
                                 height: self.view.frame.height - offset)
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
    }

    override func viewDidAppear(_ animated: Bool) {
        self.title = config.0
        
        let image: UIImage! = UIImage(named: config.0 + ".jpg")
        let con = Pixelate.render(pixels: image.cgImage!,
                                  layers: config.1)
        
        imageView.image = UIImage(cgImage: con!)
    }
}
