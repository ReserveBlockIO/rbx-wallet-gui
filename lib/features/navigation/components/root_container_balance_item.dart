import 'package:flutter/material.dart';

import '../../../core/theme/components.dart';
import '../constants.dart';
import '../root_container.dart';

class RootContainerBalanceItem extends StatefulWidget {
  final String heading;
  final Color headingColor;
  final String accountCount;
  final List<Widget> actions;
  final Widget? latestTx;
  final bool forceExpand;

  const RootContainerBalanceItem({
    super.key,
    required this.heading,
    required this.headingColor,
    required this.accountCount,
    this.actions = const [],
    this.latestTx,
    required this.forceExpand,
  });

  @override
  State<RootContainerBalanceItem> createState() => RootContainerBalanceItemState();
}

class RootContainerBalanceItemState extends State<RootContainerBalanceItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onExit: (_) {
        setState(() {
          isExpanded = false;
        });
      },
      onEnter: (_) {
        setState(() {
          isExpanded = true;
        });
      },
      child: GestureDetector(
        onTap: () {},
        child: AppCard(
          padding: 6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: ROOT_CONTAINER_TRANSITION_DURATION,
                curve: Curves.easeInOut,
                height: widget.forceExpand || isExpanded ? ROOT_CONTAINER_BALANCE_ITEM_EXPANDED_HEIGHT : 0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: ScrollConfiguration(
                  behavior: NoThumbScrollBehavior().copyWith(
                    scrollbars: false,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.accountCount,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        SizedBox(
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Latest TX:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "View All Txs",
                                  style: TextStyle(
                                    color: widget.headingColor.withOpacity(0.65),
                                    fontSize: 13,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: widget.latestTx ??
                                  SizedBox(
                                    width: 250,
                                    height: 100,
                                    child: AppCard(
                                      child: Center(
                                        child: Text(
                                          "No Transactions",
                                          style: Theme.of(context).textTheme.caption,
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Wrap(
                          children: widget.actions,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                widget.heading,
                style: TextStyle(
                  fontSize: 24,
                  color: widget.headingColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
