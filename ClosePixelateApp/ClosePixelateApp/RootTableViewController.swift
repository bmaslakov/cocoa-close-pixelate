import Foundation
import UIKit
import ClosePixelate

public class RootTableViewController: UITableViewController {
    private let cellId = "Cell"
    private let segueId = "Segue1"
    
    private let configurations = [
        (
            "officer",
            [
                PixelateLayer(.diamond, resolution: 48, size: 50),
                PixelateLayer(.diamond, resolution: 48, offset: 24),
                PixelateLayer(.diamond, resolution: 8, size: 6)
            ]
        ), (
            "stanley",
            [
                PixelateLayer(.square, resolution: 32),
                PixelateLayer(.circle, resolution: 32, offset: 15),
                PixelateLayer(.circle, resolution: 32, size: 26, offset: 13),
                PixelateLayer(.circle, resolution: 32, size: 18, offset: 10),
                PixelateLayer(.circle, resolution: 32, size: 12, offset: 8)
            ]
        ), (
            "take-my-portrait",
            [
                PixelateLayer(.square, resolution: 48),
                PixelateLayer(.diamond, resolution: 48, offset: 12, alpha: 0.5),
                PixelateLayer(.diamond, resolution: 48, offset: 36, alpha: 0.5),
                PixelateLayer(.diamond, resolution: 16, size: 8, offset: 4)
            ]
        ), (
            "tony",
            [
                PixelateLayer(.circle, resolution: 32, size: 6, offset: 8),
                PixelateLayer(.circle, resolution: 32, size: 9, offset: 8),
                PixelateLayer(.circle, resolution: 32, size: 12, offset: 24),
                PixelateLayer(.circle, resolution: 32, size: 9, offset: 0)
            ]
        ), (
            "wonder",
            [
                PixelateLayer(.diamond, resolution: 24, size: 25),
                PixelateLayer(.diamond, resolution: 24, offset: 12),
                PixelateLayer(.square, resolution: 24, alpha: 0.6)
            ]
        ), (
            "anita",
            [
                PixelateLayer(.square, resolution: 32),
                PixelateLayer(.circle, resolution: 32, offset: 16),
                PixelateLayer(.circle, resolution: 32, offset: 0, alpha: 0.5),
                PixelateLayer(.circle, resolution: 16, size: 9, offset: 0, alpha: 0.5)
            ]
        ), (
            "giraffe",
            [
                PixelateLayer(.circle, resolution: 24),
                PixelateLayer(.circle, resolution: 24, size: 9, offset: 12)
            ]
        ), (
            "kendra",
            [
                PixelateLayer(.square, resolution: 48, offset: 12),
                PixelateLayer(.circle, resolution: 48, offset: 0),
                PixelateLayer(.diamond, resolution: 16, size: 15, offset: 0, alpha: 0.6),
                PixelateLayer(.diamond, resolution: 16, size: 15, offset: 8, alpha: 0.6)
            ]
        ), (
            "gavin",
            [
                PixelateLayer(.square, resolution: 48),
                PixelateLayer(.diamond, resolution: 12, size: 8),
                PixelateLayer(.diamond, resolution: 12, size: 8, offset: 6)
            ]
        )
    ]
    
    public override func viewDidLoad() {
        title = "ClosePixelate"
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configurations.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = configurations[indexPath.row].0
        return cell
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId {
            let indexPath = self.tableView.indexPathForSelectedRow
            let destination = segue.destination as! ViewController
            let index = (indexPath?.row)!
            destination.config = configurations[index]
        }
    }
}
