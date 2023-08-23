import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/views/login.dart';

import '../utils/utilities.dart';
class HomeScreen extends StatefulWidget {

  static String id = 'chat_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Whatsapp'),
          backgroundColor: Colors.green,
          bottom: const TabBar(
            tabs: [
              Icon(Icons.camera_alt_rounded),
              Text('Chats'),
              Text('Status'),
              Text('Calls')
            ],
          ),
          actions: [
            const Icon(Icons.search),
            const SizedBox(width: 10),
            PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (
                    context,
                    ) =>
                [
                  const PopupMenuItem(
                    value: '1',
                    child: Text('New Group'),
                  ),
                  const PopupMenuItem(
                    value: '2',
                    child: Text('Settings'),
                  ),
                  PopupMenuItem(
                    value: '3',
                    mouseCursor: MouseCursor.defer,
                    child: const Text('Logout'),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  )
                ]),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Mir Hasnain'),
                accountEmail: Text('shaikhhasnain323@gmail.com'),
                currentAccountPicture: Image(
                    image: AssetImage('images/my.jpg')
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.home_filled),
                title: Text('Home Screen'),
              ),
              ListTile(
                onTap: ()async{
                  await auth.signOut().then((value){
                    Navigator.pushNamed(context, Login.id);
                  }).onError((error, stackTrace){
                    Utils.showToast(error.toString());
                  });
                },
                leading: const Icon(Icons.login_outlined),
                title: const Text('Log Out'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text('No camera'),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 300,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      trailing: Text('3:42 PM'),
                      leading: CircleAvatar(
                          backgroundImage: AssetImage('images/musk.jpg')),
                      title: Text('Elon Musk'),
                      subtitle: Text('dont want to tell you last message'),
                    );
                  }),
            ), // chats
            Expanded(
              child: ListView.builder(
                  itemCount: 300,
                  itemBuilder: (context, index) {
                    if(index == 0){
                      return const Column(
                        children: [
                          ListTile(
                            trailing: Icon(Icons.camera_alt_rounded),
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage('images/download.jpg'),
                            ),
                            title: Text('My Status'),
                            subtitle: Text('39 minutes ago'),
                          ),
                          Divider(
                            thickness: 3,
                          )
                        ],
                      );
                    }
                    else
                    {
                      return ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border: Border.all(
                                color: Colors.green,
                                width: 4,
                              )
                          ),
                          child: const CircleAvatar(
                              backgroundImage: AssetImage('images/downloaded.jpg')),
                        ),
                        title: const Text('Culpa Mia'),
                        subtitle: const Text('45 minutes ago'),
                      );
                    }
                  }),
            ), //status
            Expanded(
              child: ListView.builder(
                  itemCount: 300,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: index % 2 == 0 ? const Icon(Icons.call) : const Icon(Icons.video_call),
                      leading: const CircleAvatar(
                          backgroundImage: AssetImage('images/tate.jpg')
                      ),
                      title: Text('Andrew Tate'),
                      subtitle: Text(index%2 == 0? 'Missed voice call at 8:65 PM' : 'Missed video call at 9:45 PM'),
                    );
                  }),
            ), // calls
          ],
        ),
      ),
    );
  }
}
