//
//  RestaurantTableViewController.swift
//  Restaurants
//
//  Created by admin on 9/09/16.
//  Copyright © 2016 eafit. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var model = RestaurantModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRestaurants()

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

    // Nùmero de secciones en la pantalla, donde se mostrarà el tableView (listado)
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // Acà retornamos el nùmero de rows que tendrà la tabla, serà igual al nùmero de elementos en el listado que manejaremos.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // Es recomendable ir al modelo directamente para traer los datos actualizados.
        return model.restaurants.count
    }

    // Acà se meten los datos a cada celda
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantCell", forIndexPath: indexPath) as! RowTableViewCell

        // Configure the cell..
        let restaurant = model.restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.detailsLabel.text = restaurant.details
        cell.iconImageView.image = UIImage(named: restaurant.image)

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // Este mètodo se ejecuta al darle clic (tocar) una fila del listado (un elemento de la lista)
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Se obtiene el elemento de la lista seleccionado (indextPath.row)
        let restaurant = model.restaurants[indexPath.row]
        
        //Se envìa el elemento seleccionado (objeto restaurant) al segue creado entre la el tableView que identificamos con el id: detail, y se lo enviamos a la otra vista.
        performSegueWithIdentifier("detail", sender: restaurant)
    }
    
    // MARK: - Navigation

    
    // Recibe los paràmetros enviados desde el mètodo didSelectRowAtIndexPath, para prepararlos y enviarlos a la otra vista.
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // creamos destination con la instancia de la clase para donde  va (vista detail, que està manejada por la clase que creamos DetailViewController, y en esta clase asignamos a la variable restaurant, el objeto de restaurant que nos llega en el paràmetro sender.
        let destination = segue.destinationViewController as! DetailViewController
        destination.restaurant = (sender as! Restaurant)
    }
    
    func getRestaurants()  {
        model.getRestaurantsFromServer{ (success, response) in
            if success {
                self.tableView.reloadData()
            }else {
                //ERROR +
                
            }
        }
        
    }

}
