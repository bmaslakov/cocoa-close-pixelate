import UIKit
import ClosePixelate

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var config: (String, [PixelateLayer])!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        imageView.contentMode = .scaleAspectFit
    }

    override func viewDidAppear(_ animated: Bool) {
        self.title = config.0
        
        let image: UIImage! = UIImage(named: config.0 + ".jpg")
        let con = Pixelate.render(pixels: image.cgImage!,
                                  layers: config.1)
        
        imageView.image = UIImage(cgImage: con!)
    }
}

