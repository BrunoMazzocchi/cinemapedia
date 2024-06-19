import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  void onTap(int value, BuildContext context) {
    switch (value) {
      case 0:
        context.go('/');
        break;
      case 1:
        // Go to Categories
        break;
      case 2:
        context.go('/favorites');
        break;
      default:
        break;
    }
  }

  int getCurrentIndex(BuildContext context) {
    final currentPath = GoRouterState.of(context).fullPath;
    switch (currentPath) {
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;
      default:
        return 0;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: getCurrentIndex(context),
      onTap: (value) => onTap(value, context),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}