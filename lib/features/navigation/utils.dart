import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

enum RootTab {
  home(0),
  send(1),
  receive(2),
  transactions(3),
  validator(4),
  adjudicator(5),
  nodes(6),
  nfts(7),
  smartContracts(8),
  dsts(9),
  adnr(10),
  voting(11),
  beacons(12),
  tokens(13),
  reserve(14),
  vbtc(15),
  operations(16),
  ;

  final int i;
  const RootTab(this.i);
}

class RootContainerUtils {
  static navigateToTab(BuildContext context, RootTab tab) {
    AutoTabsRouter.of(context).setActiveIndex(tab.i);
  }
}
