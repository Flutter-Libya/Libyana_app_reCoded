import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem('Profile', Icons.person),
    MenuItem('Plan & Packages', Icons.sim_card),
    MenuItem('Billing & Payments', Icons.payment),
    MenuItem('Usage History', Icons.history),
    MenuItem('Support', Icons.support_agent),
    MenuItem('Settings', Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: menuItems.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
            
              return DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              );
            }
            final menuItem = menuItems[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                leading: Icon(menuItem.icon, color: Colors.blue),
                title: Text(menuItem.title),
                onTap: () {},
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 100,),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: ClipOval(
                child: Image.asset(
                  'assets/Libyana.png',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Libyana Admin User',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: menuItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final menuItem = menuItems[index];
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(menuItem.icon, size: 50, color: Colors.blue),
                            SizedBox(height: 10),
                            Text(
                              menuItem.title,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;

  MenuItem(this.title, this.icon);
}
