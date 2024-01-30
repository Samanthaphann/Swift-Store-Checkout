import Foundation

// Global cart dictionary to track items and quantities
var totalCartCost: Double = 0.0
var totalSales: Double = 0.0
var cart: [String: Int] = [:]
let itemPrices = ["Cereal": 2.99, "Milk": 1.99, "Syrup": 3.49, "Cups": 0.99]
var itemStock: [String: Int] = ["Cereal": 50, "Milk": 50, "Syrup": 50, "Cups": 50]
mainMenu()

//main menu
func mainMenu() {
    print(
        "Welcome to the grocery store! Let us know how we can help you?:\n",
        "1. Add to Cart\n",
        "2. Remove Item from Cart\n",
        "3. Check if Item is in Cart\n",
        "4. Admin Menu \n",
        "5. Checkout \n"
    )
    
    //transports you to the other menus if chosen
    if let userPick = readLine() {
        if userPick == "1" {
            addToCartMenu()
        } else if userPick == "2" {
            removeChoiceMenu()
        } else if userPick == "3" {
            checkItemMenu()
        } else if userPick == "4" {
            adminMenu()
        } else if userPick == "5" {
            checkoutMenu()
        }
    }
}


//add stuff to cart
func addToCartMenu() {
    print(
        "What would you like to add to cart?:\n",
        "1. Cereal \n",
        "2. Milk \n",
        "3. Syrup \n",
        "4. Cups \n"
    )
//transports you to the other menus if chosen
    if let addChoice = readLine() {
        if addChoice == "1" {
            qOfCereal()
        } else if addChoice == "2" {
            qOfMilk()
        } else if addChoice == "3" {
            qOfSyrup()
        } else if addChoice == "4" {
            qOfCups()
        }
    }
}

func qOfCereal() {
    print("How many Cereal(s) would you like to add to your cart?")
    //adds the quantity to the cart
    if let quantityInput = readLine(), let intQuantity = Int(quantityInput), intQuantity > 0 {
        addItemsToCart(item: "Cereal", quantity: intQuantity)
    } else {
        print("Invalid quantity. Please enter a positive number.")
    }

    // Return to the main menu
    mainMenu()
}

func qOfMilk() {
    print("How many Milk(s) would you like to add to your cart?")
    //adds the quantity to the cart
    if let quantityInput = readLine(), let intQuantity = Int(quantityInput), intQuantity > 0 {
        addItemsToCart(item: "Milk", quantity: intQuantity)
    } else {
        print("Invalid quantity. Please enter a positive number.")
    }

    // Return to the main menu
    mainMenu()
}

func qOfSyrup() {
    print("How many Syrup(s) would you like to add to your cart?")
    //adds the quantity to the cart
    if let quantityInput = readLine(), let intQuantity = Int(quantityInput), intQuantity > 0 {
        addItemsToCart(item: "Syrup", quantity: intQuantity)
    } else {
        print("Invalid quantity. Please enter a positive number.")
    }

    // Return to the main menu
    mainMenu()
}

func qOfCups() {
    print("How many Cups would you like to add to your cart?")
    //adds the quantity to the cart
    if let quantityInput = readLine(), let intQuantity = Int(quantityInput), intQuantity > 0 {
        addItemsToCart(item: "Cups", quantity: intQuantity)
    } else {
        print("Invalid quantity. Please enter a positive number.")
    }

    // Return to the main menu
    mainMenu()
}

func addItemsToCart(item: String, quantity: Int) {
    if let price = itemPrices[item] {
        let itemCost = price * Double(quantity)
        // Check if there is enough stock
        if let currentStock = itemStock[item], currentStock >= quantity {
            // Update the cart dictionary with the added items
            cart[item, default: 0] += quantity
            totalCartCost += itemCost
            // Subtract the quantity from the stock
            itemStock[item]! -= quantity
            print("You have added \(quantity) \(item)(s) to the cart. Total cart cost: $\(String(format: "%.2f", totalCartCost))")
        } else {
            print("Not enough \(item)(s) in stock to add to the cart.")
        }
    } else {
        print("Invalid item: \(item)")
    }

    // Return to the main menu
    mainMenu()
}

func removeChoiceMenu() {
    print("What would you like to remove from cart?:\n",
          "1. Cereal \n",
          "2. Milk \n",
          "3. Syrup \n",
          "4. Cups \n",
          "5. Remove everything from cart"
    )

    // If chose it goes to the other menus
    if let removeChoice = readLine() {
        if removeChoice == "1" {
            removeCereal()
        } else if removeChoice == "2" {
            removeMilk()
        } else if removeChoice == "3" {
            removeSyrup()
        } else if removeChoice == "4" {
            removeCups()
        } else if removeChoice == "5" {
            removeAll()
        }
    }
}

func removeAll(){
    print("Would you like to remove everything from cart? \n",
          "1. yes \n",
          "2. no \n")
    
    //if chosen then it returns to the menu
        if let removeAllChoice = readLine() {
        if removeAllChoice == "1" {
            removeEverything()
        } else if removeAllChoice == "2" {
            mainMenu()
        }
    }
    
}

func removeEverything() {
    print("Removing all items from the cart.")

    // Iterate through items in the cart and add quantities back to the stock
    for (item, quantity) in cart {
        if let currentStock = itemStock[item] {
            itemStock[item] = currentStock + quantity
        }
    }

    // Clear the cart and update total cart cost
    cart = [:]
    //makes the total 0
    totalCartCost = 0.0

    print("All items have been removed from the cart.")

    // Return to the main menu
    mainMenu()
}
func removeCereal() {
    print("How many Cereal(s) would you like to remove from your cart?")
    //if the number chose is larger than 0, then it updates the cart
    if let quantityInput = readLine(), let intQuantity = Int(quantityInput), intQuantity > 0 {
        removeItemsFromCart(item: "Cereal", quantity: intQuantity)
    } else {
        print("Invalid quantity. Please enter a positive number.")
    }

    // Return to the main menu
    mainMenu()
}

func removeMilk() {
    print("How many Milk(s) would you like to remove from your cart?")
    if let quantityInput = readLine(), let intQuantity = Int(quantityInput), intQuantity > 0 {
        removeItemsFromCart(item: "Milk", quantity: intQuantity)
    } else {
        print("Invalid quantity. Please enter a positive number.")
    }

    // Return to the main menu
    mainMenu()
}

func removeSyrup() {
    print("How many Syrup(s) would you like to remove from your cart?")
    if let quantityInput = readLine(), let intQuantity = Int(quantityInput), intQuantity > 0 {
        removeItemsFromCart(item: "Syrup", quantity: intQuantity)
    } else {
        print("Invalid quantity. Please enter a positive number.")
    }

    // Return to the main menu
    mainMenu()
}

func removeCups() {
    print("How many Cups would you like to remove from your cart?")
    if let quantityInput = readLine(), let intQuantity = Int(quantityInput), intQuantity > 0 {
        removeItemsFromCart(item: "Cups", quantity: intQuantity)
    } else {
        print("Invalid quantity. Please enter a positive number.")
    }

    // Return to the main menu
    mainMenu()
}



func removeItemsFromCart(item: String, quantity: Int) {
    if let price = itemPrices[item] {
        // Check if the item is in the cart
        if let currentQuantity = cart[item], currentQuantity >= quantity {
            let itemCost = price * Double(quantity)
            // Update the cart dictionary with the removed items
            cart[item, default: 0] -= quantity
            totalCartCost -= itemCost
            // Add the quantity back to the stock
            itemStock[item]! += quantity
            print("You have removed \(quantity) \(item)(s) from the cart. Updated total cart cost: $\(String(format: "%.2f", totalCartCost))")
        } else {
            print("You don't have enough \(item)(s) in your cart to remove.")
        }
    } else {
        print("Invalid item: \(item)")
    }

    // Return to the main menu
    mainMenu()
}


func checkItemMenu() {
    print("Which item would you like to check in the cart? \n",
          "1. Cereal \n",
          "2. Milk \n",
          "3. Syrup \n",
          "4. Cups \n")

    // Read user input for the item to check
    if let itemToCheck = readLine(), let itemNumber = Int(itemToCheck) {
        checkItemInCart(itemNumber: itemNumber)
    }
}

func checkItemInCart(itemNumber: Int) {
    // Mapping item number to the actual item name
    let itemMapping = [1: "Cereal", 2: "Milk", 3: "Syrup", 4: "Cups"]

    if let itemName = itemMapping[itemNumber] {
        if let quantity = cart[itemName] {
            print("\(itemName)(s) in the cart: \(quantity)")
        } else {
            print("\(itemName) is not in the cart.")
        }
    } else {
        print("Invalid choice. Please choose a valid item.")
        mainMenu()    }
    mainMenu()
}



func adminMenu() {
    print("Please enter the Admin password to enter.")
    if let adminInput = readLine(), let id = Int(adminInput){
        checkId(adminInput)
    }
}
    
func checkId(_ adminInput: String){
    if let idEntered = Int(adminInput), idEntered == 0000 {
        adminChoice()
    } else {
        print("Wrong Admin ID entered. Try Again!")
        mainMenu()
    }
}
   
    
func adminChoice() {
    print(
        "Welcome to the Admin menu! Let us know how we can help you (Enter the number of the selection): \n",
        "1. Restock inventory \n",
        "2. Generate report \n",
        "3. Check number of items \n",
        "4. Quit admin menu \n"
    )
    
    if let adminChoice = readLine() {
        handleAdminChoice(adminChoice)
    } else {
        //if it pics options other than 1-4 than it returs to the adminchoice menu
        print("Error reading input.")
        adminChoice()
    }
}

//directs to other functions when number is typed in
func handleAdminChoice(_ choice: String) {
    if choice == "1" {
        restockInventory()
    } else if choice == "2" {
        generateReport()
    } else if choice == "3" {
        checkNumberOfItems()
    } else if choice == "4" {
        print("Exiting Admin menu.")
        mainMenu()
    } else {
        print("Invalid choice. Please enter a valid number.")
        adminChoice()
    }
}

//directs to other functions when number is typed in
func restockInventory() {
    print("What would you like to restock? (Enter number of selection): \n",
          "1. Cereal \n",
          "2. Milk \n",
          "3. Syrup \n",
          "4. Cups \n")
    if let restockChoice = readLine() {
        if restockChoice == "1" {
            restockCereal()
        } else if restockChoice == "2" {
            restockMilk()
        } else if restockChoice == "3" {
            restockSyrup()
        } else if restockChoice == "4" {
            restockCups()
        } else {
            print("Invalid choice. Please enter a valid number.")
            restockInventory()
        }
    }
}

func restockCereal() {
    print("How many Cereal(s) would you like to restock?")
    
    if let restockQuantityInput = readLine(), let restockQuantity = Int(restockQuantityInput), restockQuantity > 0 {
        // Update the stock count by adding the restocked quantity
        itemStock["Cereal", default: 0] += restockQuantity
        print("\(restockQuantity) Cereal(s) has been restocked. New stock count: \(itemStock["Cereal"] ?? 0)")
        adminChoice()
    } else {
        print("Invalid quantity. Please enter a positive number.")
        restockCereal()
    }
}

func restockMilk(){
    print("How many Milk(s) would you like to restock?")
    
    if let restockQuantityInput = readLine(), let restockQuantity = Int(restockQuantityInput), restockQuantity > 0 {
        // Update the stock count by adding the restocked quantity
        itemStock["Milk", default: 0] += restockQuantity
        print("\(restockQuantity) Milk(s) has been restocked. New stock count: \(itemStock["Milk"] ?? 0)")
        adminChoice()
    } else {
        print("Invalid quantity. Please enter a positive number.")
        restockMilk()
    }
}

func restockSyrup(){
    print("How many bottles of Syrup(s) would you like to restock?")
    
    if let restockQuantityInput = readLine(), let restockQuantity = Int(restockQuantityInput), restockQuantity > 0 {
        // Update the stock count by adding the restocked quantity
        itemStock["Syrup", default: 0] += restockQuantity
        print("\(restockQuantity) Syrup(s) has been restocked. New stock count: \(itemStock["Syrup"] ?? 0)")
        adminChoice()
    } else {
        print("Invalid quantity. Please enter a positive number.")
        restockSyrup()
    }
}

func restockCups(){
    print("How many Cups would you like to restock?")
    
    if let restockQuantityInput = readLine(), let restockQuantity = Int(restockQuantityInput), restockQuantity > 0 {
        // Update the stock count by adding the restocked quantity
        itemStock["Cups", default: 0] += restockQuantity
        print("\(restockQuantity) Cups has been restocked. New stock count: \(itemStock["Cups"] ?? 0)")
        adminChoice()
    } else {
        print("Invalid quantity. Please enter a positive number.")
        restockCups()
    }
}


//var currentCerealsInStock: Int = 50
//var currentMilksInStock: Int = 50
//var currentSyrupsInStock: Int = 50
//var currentCupsInStock: Int = 50


func generateReport(){
    //summarizes all of the stock of items. Shiws the quantity of each item
    print("Summary Report\n",
          "Remaining cereals: \(itemStock["Cereal"] ?? 0) items \n",
          "Remaining milks: \(itemStock["Milk"] ?? 0) items \n",
          "Remaining syrups: \(itemStock["Syrup"] ?? 0) items \n",
          "Remaining cups: \(itemStock["Cups"] ?? 0) items \n",
          "Total sales: $\(String(format: "%.2f", totalSales))"
    )
     adminChoice()
}


func checkNumberOfItems() {
    print("What item do you want to check the stock of? (Enter number of selection): \n",
          "1. Cereal \n",
          "2. Milk \n",
          "3. Syrup \n",
          "4. Cups \n")

//directs to other functions when number is typed in
    if let checkChoice = readLine() {
        if checkChoice == "1" {
            checkCereal()
        } else if checkChoice == "2" {
            checkMilk()
        } else if checkChoice == "3" {
            checkSyrup()
        } else if checkChoice == "4" {
            checkCups()
        } else {
            print("Invalid choice. Please enter a valid number.")
            // Return to the admin menu
            mainMenu()
        }
    }
}

func checkCereal() {
    if let stock = itemStock["Cereal"] {
        print("Remaining Cereal(s) in stock: \(stock) items")
    } else {
        print("Error: Unable to retrieve Cereal stock information.")
    }
    
    // Return to the admin menu
    adminChoice()
}

func checkMilk() {
    if let stock = itemStock["Milk"] {
        print("Remaining Milk(s) in stock: \(stock) items")
    } else {
        print("Error: Unable to retrieve Milk stock information.")
    }
    
    // Return to the admin menu
    adminChoice()
}

func checkSyrup() {
    if let stock = itemStock["Syrup"] {
        print("Remaining Syrup(s) in stock: \(stock) items")
    } else {
        print("Error: Unable to retrieve Syrup stock information.")
    }
    
    // Return to the admin menu
    adminChoice()
}

func checkCups() {
    if let stock = itemStock["Cups"] {
        print("Remaining Cup(s) in stock: \(stock) items")
    } else {
        print("Error: Unable to retrieve Cup stock information.")
    }
    
    // Return to the admin menu
    adminChoice()
}

    
    
func checkoutMenu() {
    // Calculate subtotal
        let subtotal = totalCartCost
        
        // Calculate tax
        let taxRate = 0.0975
        let tax = subtotal * taxRate
        
        // Calculate total
        let total = subtotal + tax
        
        // Print the receipt
        print("Receipt:")
        print("Subtotal: $\(String(format: "%.2f", subtotal))")
        print("Tax (9.75%): $\(String(format: "%.2f", tax))")
        print("Total: $\(String(format: "%.2f", total))")
        
        // Update total sales
        totalSales += total
        
        // Clear the cart
        cart = [:]
        totalCartCost = 0.0
        
        // Return to the main menu
        mainMenu()
    }

