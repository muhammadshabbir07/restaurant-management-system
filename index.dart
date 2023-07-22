import 'dart:io';

var userSession, regId, regUser, regEmail, regPass, regNumber, regAddress;

List<Map<dynamic, dynamic>> usersData = [
  {
    "userId": "01",
    "username": "shabbir",
    "userEmail": "shabbir@gmail.com",
    "userNumber": "03035825467",
    "userAddress": "North Karachi, Karachi",
    "userRole": "admin",
    "userPass": "shabbir123"
  },
  {
    "userId": "02",
    "username": "burhan",
    "userEmail": "burhan@gmail.com",
    "userNumber": "03035823425",
    "userAddress": "Owrangi Town, Karachi",
    "userRole": "customer",
    "userPass": "burhan123"
  },
  {
    "userId": "03",
    "username": "naeem",
    "userEmail": "naeem@gmail.com",
    "userNumber": "03035822390",
    "userAddress": "Malir Cantt, Karachi",
    "userRole": "customer",
    "userPass": "naeem123"
  }
];

List<Map<dynamic, dynamic>> restaurantMenus = [
  {
    "prodId": "01",
    "prodCategory": "Burgers",
    "prodName": "Zinger Burger",
    "prodPrice": "320"
  },
  {
    "prodId": "02",
    "prodCategory": "Burgers",
    "prodName": "Beef Burger",
    "prodPrice": "300"
  },
  {
    "prodId": "03",
    "prodCategory": "Burgers",
    "prodName": "Chicken Burger",
    "prodPrice": "280"
  },
  {
    "prodId": "04",
    "prodCategory": "Burgers",
    "prodName": "Veggie Burger",
    "prodPrice": "250"
  },
  {
    "prodId": "05",
    "prodCategory": "Barbeque",
    "prodName": "Chicken Tikka",
    "prodPrice": "350"
  },
  {
    "prodId": "06",
    "prodCategory": "Barbeque",
    "prodName": "Reshmi Kabab",
    "prodPrice": "380"
  },
  {
    "prodId": "07",
    "prodCategory": "Barbeque",
    "prodName": "Boti Kabab",
    "prodPrice": "320"
  },
  {
    "prodId": "08",
    "prodCategory": "Barbeque",
    "prodName": "Fish Tikka",
    "prodPrice": "400"
  },
  {
    "prodId": "09",
    "prodCategory": "Desserts",
    "prodName": "Gulab Jamun",
    "prodPrice": "80"
  },
  {
    "prodId": "10",
    "prodCategory": "Desserts",
    "prodName": "Kheer",
    "prodPrice": "100"
  },
  {
    "prodId": "11",
    "prodCategory": "Desserts",
    "prodName": "Jalebi",
    "prodPrice": "70"
  },
  {
    "prodId": "12",
    "prodCategory": "Desserts",
    "prodName": "Firni",
    "prodPrice": "120"
  },
  {
    "prodId": "13",
    "prodCategory": "Biryani",
    "prodName": "Chicken Biryani",
    "prodPrice": "350"
  },
  {
    "prodId": "14",
    "prodCategory": "Biryani",
    "prodName": "Mutton Biryani",
    "prodPrice": "400"
  },
  {
    "prodId": "15",
    "prodCategory": "Biryani",
    "prodName": "Beef Biryani",
    "prodPrice": "380"
  },
  {
    "prodId": "16",
    "prodCategory": "Biryani",
    "prodName": "Vegetable Biryani",
    "prodPrice": "300"
  },
  {
    "prodId": "17",
    "prodCategory": "Others",
    "prodName": "Soft Drinks",
    "prodPrice": "50"
  },
  {
    "prodId": "18",
    "prodCategory": "Others",
    "prodName": "Roti",
    "prodPrice": "20"
  },
];

String loginUserId = "0";
List<Map<dynamic, dynamic>> getOrders = [];

void main() {
  bool commandChecked = true;
  print("*********************************");
  print("* Welcome to Our ABC Restaurant *");
  print("*********************************");

  while (commandChecked) {
    print("\n --> Press 1 if you are a Customer");
    print(" --> Press 2 if you are an Admin");

    String? userInput = stdin.readLineSync();

    if (userInput == "1") {
      bool loginRegCommandCheck = true;
      while (loginRegCommandCheck) {
        print(" --> Press 1 for Login");
        print(" --> Press 2 for Registration");

        String? loginReg = stdin.readLineSync();

        if (loginReg == "1") {
          login();
          loginRegCommandCheck = false;
        } else if (loginReg == "2") {
          registration();
          loginRegCommandCheck = false;
        } else {
          print(" --> You have chosen the wrong command \n");
          print(" --> Please choose a correct command");
        }
      }
      commandChecked = false;
    } else if (userInput == "2") {
      bool loginRegCommandCheck = true;
      while (loginRegCommandCheck) {
        print(" --> Press 1 for Login");

        String? loginReg = stdin.readLineSync();

        if (loginReg == "1") {
          login();
          loginRegCommandCheck = false;
        } else {
          print(" --> You have chosen the wrong command \n");
          print(" --> Please choose a correct command");
        }
      }
      commandChecked = false;
    } else {
      print(" *** You have chosen the wrong command *** \n");
      print(" *** Please choose a correct command *** ");
    }
  }
}

void login() {
  bool loginCommandCheck = true;
  while (loginCommandCheck) {
    print("\n**********************************");
    print("* Please Log in to Our System!!! *");
    print("**********************************");

    print(" --> Enter Your Email Address: ");
    String? loginEmail = stdin.readLineSync();

    print(" --> Enter Your Password: ");
    String? loginPass = stdin.readLineSync();

    if (loginEmail != null && loginPass != null) {
      bool loggedIn = false;

      for (var i = 0; i < usersData.length; i++) {
        if (usersData[i]["userEmail"].toString().toLowerCase() ==
                loginEmail.toLowerCase() &&
            usersData[i]["userPass"].toString().toLowerCase() ==
                loginPass.toLowerCase()) {
          loginUserId = usersData[i]['userId'];
          loggedIn = true;
          print(
              " *** ${usersData[i]['userRole']} Logged In Successfully! *** ");
          loginCommandCheck = false;
          if (usersData[i]['userRole'] == "customer") {
            showMenu(loginUserId);
          } else if (usersData[i]['userRole'] == "admin") {
            admin();
          }
          break;
        }
      }
      if (!loggedIn) {
        print(" *** Email and Password don't match! *** ");
      }
    } else {
      print(" *** Email and Password are Required! *** ");
    }
  }
}

void registration() {
  bool loginCommandCheck = true;
  while (loginCommandCheck) {
    print("\n*************************************");
    print("* Please Register in to Our System!!! *");
    print("***************************************");

    regId = int.parse(usersData.last["userId"]) + 1;

    print(" --> Enter Your Email Address: ");
    regEmail = stdin.readLineSync();

    print(" --> Enter Your Phone Number: ");
    regNumber = stdin.readLineSync();

    print(" --> Enter Your Address: ");
    regAddress = stdin.readLineSync();

    print(" --> Enter Your Password: ");
    regPass = stdin.readLineSync();

    if (regEmail != null &&
        regNumber != null &&
        regAddress != null &&
        regPass != null) {
      if (regEmail.contains("@")) {
        regUser = regEmail.substring(0, regEmail.indexOf("@"));
        if (double.tryParse(regNumber) != null) {
          bool emailExists = false;
          for (var users in usersData) {
            if (regEmail == users["userEmail"]) {
              emailExists = true;
              break;
            }
          }

          if (emailExists) {
            print(" *** Email already exists. *** ");
          } else {
            Map<dynamic, dynamic> regUserData = {
              "userId": regId.toString(),
              "username": regUser,
              "userEmail": regEmail,
              "userNumber": regNumber,
              "userAddress": regAddress,
              "userRole": "customer",
              "userPass": regPass
            };

            usersData.add(regUserData);

            print(" *** Account Created Successfully! ***");
            loginCommandCheck = false;
            login();
          }
        } else {
          print(
              " *** Invalid Phone Number! Please enter a valid number for the Phone Number. *** ");
        }
      } else {
        print(
            " *** Invalid Email Address! Please enter a valid email address. *** ");
      }
    }
  }
}

void showMenu(loginUserId) {
  print("\n\n********************");
  print("* This is Our Menu *");
  print("********************");
  Set<String> uniqueCategories = Set<String>();
  for (var menu in restaurantMenus) {
    var category = menu['prodCategory'];
    if (!uniqueCategories.contains(category)) {
      print("\nCategory: $category");
      uniqueCategories.add(category);
    }
    var prodId = menu['prodId'];
    var prodName = menu['prodName'];
    var prodPrice = menu['prodPrice'];
    print("Item ID: $prodId \t Name: $prodName \t Price: $prodPrice");
  }
  getOrder(loginUserId);
}

void getOrder(loginUserId) {
  bool addingItems = true;
  List<Map<dynamic, dynamic>> orderedItems = [];

  print("\n************************************");
  print("* Please select item id for order or type 'done' to proceed: *");
  print("************************************");

  while (addingItems) {
    String? getItemId = stdin.readLineSync();

    if (getItemId!.toLowerCase() == "done") {
      addingItems = false;
      break;
    }

    bool itemIdExists = false;
    for (var menu in restaurantMenus) {
      if (getItemId == menu["prodId"]) {
        itemIdExists = true;
        Map<dynamic, dynamic> orderData = {
          "itemId": getItemId,
          "itemName": menu["prodName"],
          "itemPrice": menu["prodPrice"],
        };
        orderedItems.add(orderData);
        print(" *** Item added to the order. *** ");
        print("\n *** Please select item id for another order or type 'done' to proceed: *** ");
        break;
      }
    }

    if (!itemIdExists) {
      print(
          " *** Item id doesn't exist. Please enter a valid item id or type 'done' to proceed. *** ");
    }
  }

  if (orderedItems.isNotEmpty) {
    double totalAmount = 0.0;
    print("\n**********************");
    print("*   INVOICE RECEIPT   *");
    print("**********************");

    String customerName = usersData[int.parse(loginUserId) - 1]["username"];
    String customerAddress =
        usersData[int.parse(loginUserId) - 1]["userAddress"];
    String customerNumber = usersData[int.parse(loginUserId) - 1]["userNumber"];

    print("Customer Name: $customerName");
    print("Customer Address: $customerAddress");
    print("Customer Phone Number: $customerNumber");

    print("\nItem ID \t Item Name \t\t Price");
    print("----------------------------------");
    for (var item in orderedItems) {
      print(
          "${item["itemId"]} \t\t ${item["itemName"]} \t\t ${item["itemPrice"]}");
      totalAmount += double.parse(item["itemPrice"].toString());
    }
    print("----------------------------------");
    print("Total Amount: \t\t\t $totalAmount");
    print("\n *** Your order has been recorded. Thank you! *** ");
  } else {
    print(" *** Your order is empty. *** ");
  }
}

void admin() {
  print("\n*** Welcome Admin ***");
  bool adminCommandCheck = true;
  while (adminCommandCheck) {
    print("\n --> Press 1 to Add Item");
    print(" --> Press 2 to Update Item");
    print(" --> Press 3 to Delete Item");
    print(" --> Press 4 to Exit Admin Mode");

    String? adminInput = stdin.readLineSync();

    if (adminInput == "1") {
      addItem();
      adminCommandCheck = false;
    } else if (adminInput == "2") {
      updateItem();
      adminCommandCheck = false;
    } else if (adminInput == "3") {
      deleteItem();
      adminCommandCheck = false;
    } else if (adminInput == "4") {
      print("\n*** Exiting Admin Mode ***");
      adminCommandCheck = false;
    } else {
      print(" --> You have chosen the wrong command \n");
      print(" --> Please choose a correct command");
    }
  }
}

void addItem() {
  bool itemCheck = true;
  while (itemCheck) {
    print("\n*** Add New Item ***");

    var prodId = (int.parse(restaurantMenus.last["prodId"]) + 1).toString();

    print(" --> Enter Product Category: ");
    String? prodCategory = stdin.readLineSync();

    print(" --> Enter Product Name: ");
    String? prodName = stdin.readLineSync();

    print(" --> Enter Product Price: ");
    String? prodPrice = stdin.readLineSync();

    if (prodId != null &&
        prodCategory != null &&
        prodName != null &&
        prodPrice != null &&
        prodId.toString().isNotEmpty &&
        prodCategory.isNotEmpty &&
        prodName.isNotEmpty &&
        prodPrice.isNotEmpty) {
      if (double.tryParse(prodPrice) != null) {
        Map<String, dynamic> newItem = {
          "prodId": prodId,
          "prodCategory": prodCategory,
          "prodName": prodName,
          "prodPrice": prodPrice,
        };
        restaurantMenus.add(newItem);
        print(" *** Item Added Successfully! *** ");
        bool commandCheck = true;

        while (commandCheck) {
          print("Do you want to add another item? (yes/no)");
          String? choice = stdin.readLineSync()?.toLowerCase();

          if (choice == "no") {
            itemCheck = false;
            commandCheck = false;
          } else if (choice != "yes") {
            print(" --> You have chosen the wrong command \n");
            print(" --> Please choose a correct command");
          } else {
            commandCheck = false;
          }
        }
      } else {
        print(
            " *** Invalid price! Please enter a valid number for the product price. *** ");
      }
    } else {
      print("All Fields are required");
    }
  }
  admin();
}

void updateItem() {
  bool itemCheck = true;
  while (itemCheck) {
    print("\n*** Update Item ***");

    print(" --> Enter Product ID to Update: ");
    String? prodId = stdin.readLineSync();

    int? index = findItemIndex(prodId);

    if (index != null && index.toString().isNotEmpty) {
      bool itemsEnter = true;
      while (itemsEnter) {
        print(" --> Enter New Product Name: ");
        String? prodName = stdin.readLineSync();

        print(" --> Enter New Product Price: ");
        String? prodPrice = stdin.readLineSync();

        if (prodName != null &&
            prodPrice != null &&
            prodName.isNotEmpty &&
            prodPrice.isNotEmpty) {
          if (double.tryParse(prodPrice) != null) {
            restaurantMenus[index]["prodName"] = prodName;
            restaurantMenus[index]["prodPrice"] = prodPrice;
            print(" *** Item Updated Successfully! *** ");
            itemCheck = false;
            itemsEnter = false;
            admin();
          } else {
            print(
                " *** Invalid price! Please enter a valid number for the product price. *** ");
          }
        } else {
          print("All fields are required");
        }
      }
    } else {
      print(" *** Item with Product ID $prodId not found! *** ");
    }
  }
}

void deleteItem() {
  bool itemCheck = true;
  while (itemCheck) {
    print("\n*** Delete Item ***");

    print(" --> Enter Product ID to Delete: ");
    String? prodId = stdin.readLineSync();

    int? index = findItemIndex(prodId);

    if (index != null && index.toString().isNotEmpty) {
      restaurantMenus.removeAt(index);
      print(" *** Item Deleted Successfully! *** ");
      itemCheck = false;
      admin();
    } else {
      print(" *** Item with Product ID $prodId not found! *** ");
    }
  }
}

int? findItemIndex(String? prodId) {
  for (int i = 0; i < restaurantMenus.length; i++) {
    if (restaurantMenus[i]["prodId"] == prodId) {
      return i;
    }
  }
  return null;
}
