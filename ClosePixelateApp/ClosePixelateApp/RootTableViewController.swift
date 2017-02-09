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
        ), (
            "stanley",
            [
                PixelateLayer(.square) {
                    $0.resolution = 32
                },
                PixelateLayer(.circle) {
                    $0.resolution = 32
                    $0.offset = 15
                },
                PixelateLayer(.circle) {
                    $0.resolution = 32
                    $0.size = 26
                    $0.offset = 13
                },
                PixelateLayer(.circle) {
                    $0.resolution = 32
                    $0.size = 18
                    $0.offset = 10
                },
                PixelateLayer(.circle) {
                    $0.resolution = 32
                    $0.size = 12
                    $0.offset = 8
                }
            ]
        ), (
            "take-my-portrait",
            [
                PixelateLayer(.square) {
                    $0.resolution = 48
                },
                PixelateLayer(.diamond) {
                    $0.resolution = 48
                    $0.offset = 12
                    $0.alpha = 0.5
                },
                PixelateLayer(.diamond) {
                    $0.resolution = 48
                    $0.offset = 36
                    $0.alpha = 0.5
                },
                PixelateLayer(.diamond) {
                    $0.resolution = 16
                    $0.size = 8
                    $0.offset = 4
                }
            ]
        ), (
            "tony",
            [
                PixelateLayer(.circle) {
                    $0.resolution = 32
                    $0.size = 6
                    $0.offset = 8
                },
                PixelateLayer(.circle) {
                    $0.resolution = 32
                    $0.size = 9
                    $0.offset = 8
                },
                PixelateLayer(.circle) {
                    $0.resolution = 32
                    $0.size = 12
                    $0.offset = 24
                },
                PixelateLayer(.circle) {
                    $0.resolution = 32
                    $0.size = 9
                    $0.offset = 0
                }
            ]
        ), (
            "wonder",
            [
                PixelateLayer(.diamond) {
                    $0.resolution = 24
                    $0.size = 25
                },
                PixelateLayer(.diamond) {
                    $0.resolution = 24
                    $0.offset = 12
                },
                PixelateLayer(.square) {
                    $0.resolution = 24
                    $0.alpha = 0.6
                }
            ]
        ), (
            "anita",
            [
                PixelateLayer(.square) {
                    $0.resolution = 32
                },
                PixelateLayer(.circle) {
                    $0.resolution = 32
                    $0.offset = 16
                },
                PixelateLayer(.circle) {
                    $0.resolution = 32
                    $0.offset = 0
                    $0.alpha = 0.5
                },
                PixelateLayer(.circle) {
                    $0.resolution = 16
                    $0.size = 9
                    $0.offset = 0
                    $0.alpha = 0.5
                }
            ]
        ), (
            "giraffe",
            [
                PixelateLayer(.circle) {
                    $0.resolution = 24
                },
                PixelateLayer(.circle) {
                    $0.resolution = 24
                    $0.size = 9
                    $0.offset = 12
                }
            ]
        ), (
            "kendra",
            [
                PixelateLayer(.square) {
                    $0.resolution = 48
                    $0.offset = 12
                },
                PixelateLayer(.circle) {
                    $0.resolution = 48
                    $0.offset = 0
                },
                PixelateLayer(.diamond) {
                    $0.resolution = 16
                    $0.size = 15
                    $0.offset = 0
                    $0.alpha = 0.6
                },
                PixelateLayer(.diamond) {
                    $0.resolution = 16
                    $0.size = 15
                    $0.offset = 8
                    $0.alpha = 0.6
                }
            ]
        ), (
            "gavin",
            [
                PixelateLayer(.square) {
                    $0.resolution = 48
                },
                PixelateLayer(.diamond) {
                    $0.resolution = 12
                    $0.size = 8
                },
                PixelateLayer(.diamond) {
                    $0.resolution = 12
                    $0.size = 8
                    $0.offset = 6
                }
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
