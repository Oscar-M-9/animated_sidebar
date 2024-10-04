import 'package:flutter_riverpod/flutter_riverpod.dart';

final isCollapsedSideBarProvider = StateProvider<bool>((ref) => false);

final sidebarShowMobileProvider = StateProvider<bool>((ref) => false);
