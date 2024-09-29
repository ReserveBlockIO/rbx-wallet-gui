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
  final VoidCallback handleViewAllTxs;
  final Widget topIndicator;

  const RootContainerBalanceItem({
    super.key,
    required this.heading,
    required this.headingColor,
    required this.accountCount,
    this.actions = const [],
    this.latestTx,
    required this.forceExpand,
    required this.handleViewAllTxs,
    required this.topIndicator,
  });

  @override
  State<RootContainerBalanceItem> createState() => RootContainerBalanceItemState();
}

class RootContainerBalanceItemState extends State<RootContainerBalanceItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
                      SizedBox(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Latest TX:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ),
                            SizedBox(
                                width: 42,
                                height: 42,
                                child: Center(
                                  child: widget.topIndicator,
                                )),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: widget.handleViewAllTxs,
                                  child: Text(
                                    "View All Txs",
                                    style: TextStyle(
                                      color: widget.headingColor.withOpacity(0.65),
                                      fontSize: 13,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 126,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: SizedBox(
                              width: 280,
                              child: widget.latestTx ??
                                  SizedBox(
                                    height: 100,
                                    child: AppCard(
                                      fullWidth: true,
                                      child: Center(
                                        child: Text(
                                          "No Transactions",
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Wrap(
                        children: widget.actions,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: SizedBox(
                          width: 230,
                          child: Divider(
                            height: 1,
                            color: Colors.white.withOpacity(0.07),
                          ),
                        ),
                      ),
                      Text(
                        widget.accountCount,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              widget.heading,
              style: TextStyle(
                fontSize: 20,
                color: widget.headingColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
