import UIKit
import ClosePixelate

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var imageId: String!
    var layers: [PixelateLayer]!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        imageView.contentMode = .scaleAspectFit
    }

    override func viewDidAppear(_ animated: Bool) {
        self.title = imageId
        
        let image: UIImage! = UIImage(named: imageId + ".jpg")
        let con = Pixelate.render(pixels: image.cgImage!,
                                  layers: layers)
        
        imageView.image = UIImage(cgImage: con)
    }
}

