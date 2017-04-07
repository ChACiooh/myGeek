//
//  ServiceListViewController.swift
//  MyGeek
//
//  Created by 표영권 on 2017. 4. 6..
//  Copyright © 2017년 표영권. All rights reserved.
//

import UIKit

class ServiceListViewController: UITableViewController {
    
    var musicGameMachines : [GameMachine] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // 저장된 기반을 바탕으로 로드하는 작업을 한다.
        // 현재는 코드 상에서 constantly 전달하지만 나중엔 파일에서 로드하는 방식?으로
        self.musicGameMachines += [GameMachine("beatmania IIDX")]
        self.musicGameMachines += [GameMachine("SOUND VOLTEX")]
        self.musicGameMachines[0].videos = [Video("ALBA")]
        
        self.musicGameMachines[0].updateNumOfItems()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return musicGameMachines.count // number of data of the model
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "BEMANI games"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicGame", for: indexPath)

        // Configure the cell...
        cell.imageView?.image = UIImage(named: "400px-SINOBUZ")
        // 셀 구분선은 seperator에 대한 속성으로
        cell.textLabel?.text = musicGameMachines[indexPath.row].name
        cell.detailTextLabel?.text = "\(musicGameMachines[indexPath.row].numOfItems)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        guard let vlvc = segue.destination as? VideoListViewController, let selectedIndex = self.tableView.indexPathForSelectedRow, let selectedVideos = self.musicGameMachines[selectedIndex.row].videos else {
            return
        }
        
        vlvc.viewedViedos = selectedVideos
    }
 

}
