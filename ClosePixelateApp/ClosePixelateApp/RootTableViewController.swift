import Foundation
import UIKit
import ClosePixelate

public class RootTableViewController: UITableViewController {
    private let cellId = "Cell"
    private let segueId = "Segue1"
    
    private let imageResources = [ "officer" ]
    private let layers = [
        [
            PixelateLayer(.diamond) {
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
            }
        ]
    ]
    
    public override func viewDidLoad() {
        title = "ClosePixelate"
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageResources.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = imageResources[indexPath.row]
        return cell
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId {
            let indexPath = self.tableView.indexPathForSelectedRow
            let destination = segue.destination as! ViewController
            let index = (indexPath?.row)!
            destination.imageId = imageResources[index]
            destination.layers = layers[index]
        }
    }
}
