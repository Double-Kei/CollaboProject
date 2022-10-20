import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          expandedHeight: 140,
          flexibleSpace: LayoutBuilder(builder: (context, constraints) {
            return FlexibleSpaceBar(
              title: AnimatedOpacity(
                opacity: constraints.biggest.height <= 120 ? 1 : 0, 
                duration: const Duration(milliseconds: 200),
                child: const Text("Account", style: TextStyle(color: Colors.black),),
              ),
              background: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.yellow, Colors.brown])),),
            );
          },),
        ),
        SliverToBoxAdapter(child: Column(children: [
          Container(
            height: 80, 
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, 
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))), 
                  child: TextButton(
                    child: SizedBox(
                      height: 40, 
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Center(child: Text("Cart", style: TextStyle(color: Colors.yellow, fontSize: 18),))), 
                    onPressed: () {}
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  child: TextButton(
                    child: SizedBox(
                      height: 40, 
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Center(child: Text("Orders", style: TextStyle(color: Colors.black, fontSize: 18),))), 
                    onPressed: () {}
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))), 
                  child: TextButton(
                    child: SizedBox(
                      height: 40, 
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Center(child: Text("Wishlist", style: TextStyle(color: Colors.yellow, fontSize: 18),))), 
                    onPressed: () {}
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 150, child: Image(image: AssetImage("images/inapp/logo.jpg"),),),
          const ProfileHeaderLabel(headerLabel: "  Account Info  ",),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 260, 
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(children: const [
                RepeatedListTile(title: "Email Address", subtitle: "example@email.com", icon: Icons.email),
                YellowDivider(),
                RepeatedListTile(title: "Phone Number", subtitle: "+11111111", icon: Icons.phone),
                YellowDivider(),
                RepeatedListTile(title: "Address", subtitle: "example: 140 - st - New Gersy", icon: Icons.location_pin,),
              ],),
            ),
          ),
          const ProfileHeaderLabel(headerLabel: "  Account Settings  "),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 260, 
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                RepeatedListTile(title: "Edit Profile", icon: Icons.edit, onPressed:() {

                },),
                const YellowDivider(),
                RepeatedListTile(title: "Change Password", icon: Icons.lock, onPressed:() {

                },),
                const YellowDivider(),
                RepeatedListTile(title: "Log Out", icon: Icons.logout, onPressed:() {

                },),
              ],),
            ),
          ),
        ],),)
      ],),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.symmetric(horizontal: 40), child: Divider(color: Colors.yellow, thickness: 1), );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function()? onPressed;

  const RepeatedListTile({
    Key? key, required this.title, this.subtitle="", required this.icon, this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(child: ListTile(title: Text(title), subtitle: Text(subtitle), leading: Icon(icon), onTap: onPressed,));
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;

  const ProfileHeaderLabel({
    Key? key, required this.headerLabel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 40, child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40, width: 50, child: Divider(color: Colors.grey, thickness: 1,),),
        Text(headerLabel, style: const TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w600),),
        const SizedBox(height: 40, width: 50, child: Divider(color: Colors.grey, thickness: 1,),),
      ]
    ),);
  }
}