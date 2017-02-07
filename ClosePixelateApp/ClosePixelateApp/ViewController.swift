import UIKit
import ClosePixelate

class ViewController: UIViewController {
    private let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.bounds = UIScreen.main.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        let image: UIImage = #imageLiteral(resourceName: "officer")
        let con = Pixelate.render(pixels: image.cgImage!,
                                  outBounds: CGRect(x: 0, y: 0, width: 800, height: 1084),
                                  layers: PixelateLayer(.diamond) {
                                    $0.resolution = 48
                                    $0.size = 50
                                  },
                                  PixelateLayer(.diamond) {
                                    $0.resolution = 48
                                    $0.offset = 24
                                  },
                                  PixelateLayer(.diamond) {
                                    $0.resolution = 8
                                    $0.size = 6
                                  })
        
        let frame = imageView.bounds
        let backgroundImage = UIImageView(frame: CGRect(x: frame.width / 8,
                                                        y: frame.height / 8,
                                                        width: frame.width / 4 * 3,
                                                        height: frame.height / 4 * 3))
        backgroundImage.image = UIImage(cgImage: con)
        backgroundImage.contentMode = .scaleAspectFit
        self.view.insertSubview(backgroundImage, at: 0)
    }
}

