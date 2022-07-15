import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/routes/router.gr.dart';

const POST = "Crear Publicación";

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Radius bordes = Radius.circular(30);
    const double drawerHeight = double.infinity;
    final double drawerWidth = MediaQuery.of(context).size.width * 0.8;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: drawerWidth,
      height: drawerHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: bordes,
          bottomRight: bordes,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _drawerButtons(context),
      ),
    );
  }

  List<Widget> _drawerButtons(BuildContext context) => [
        Expanded(flex: 1, child: Container()),
        const DrawerButton(
          route: NewPostRoute(),
          icon: Icons.post_add,
          name: POST,
        ),
        Expanded(flex: 2, child: Container()),
        // _logoutButton(context),
      ];
}

class DrawerButton extends StatelessWidget {
  final IconData icon;
  final String name;
  final PageRouteInfo<dynamic> route;

  const DrawerButton({
    Key? key,
    required this.route,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => AutoRouter.of(context).push(route),
      leading: Icon(icon, size: 28),
      title: Text(
        name,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
