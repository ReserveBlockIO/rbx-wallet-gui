import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/models/web_session_model.dart';
import 'package:rbx_wallet/features/web/components/web_wordmark.dart';

import '../../../core/app_constants.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_screen.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/env.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/singletons.dart';
import '../../../core/storage.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/web_router.gr.dart';
import '../../../generated/assets.gen.dart';
import '../../../utils/validation.dart';
import '../auth_utils.dart';
import '../components/auth_type_modal.dart';

class WebAuthScreen extends BaseStatefulScreen {
  const WebAuthScreen({Key? key})
      : super(
          key: key,
          backgroundColor: Colors.black,
        );

  @override
  WebAuthScreenScreenState createState() => WebAuthScreenScreenState();
}

class WebAuthScreenScreenState extends BaseScreenState<WebAuthScreen> {
  @override
  void initState() {
    _handleSession(ref.read(webSessionProvider));
    super.initState();
  }

  void _handleSession(WebSessionModel session) {
    final currentPath = singleton<AppRouter>().current.path;
    final bool rememberMe = singleton<Storage>().getBool(Storage.REMEMBER_ME) ?? false;

    if (session.isAuthenticated && rememberMe) {
      if (currentPath == '/') {
        AutoRouter.of(context).push(WebDashboardContainerRoute());
      }
    } else {
      // final path = Uri.base.toString().split("#").last;
      // final pathComponents = path.split("/");
      // print(pathComponents);
      // if (pathComponents[1] == "p2p" && pathComponents[2] == "shop") {
      //   final shopId = int.tryParse(pathComponents[3]);
      //   final collectionId = int.tryParse(pathComponents[5]);

      //   if (shopId == null || collectionId == null) {
      //     return;
      //   }

      //   if (pathComponents.length == 6) {
      //     if (pathComponents[4] == "collection") {
      //       AutoRouter.of(context)
      //           .pushAll([WebDashboardContainerRoute(), WebCollectionDetailScreenRoute(shopId: shopId, collectionId: collectionId)]);
      //     }
      //   }
      // }
    }
  }

  @override
  Widget body(BuildContext context) {
    void redirectToDashboard() {
      AutoRouter.of(context).push(WebDashboardContainerRoute());
    }

    // ref.listen<WebSessionModel>(webSessionProvider, (prev, next) {
    //   _handleSession(next);
    // });

    final isMobile = BreakPoints.useMobileLayout(context);

    final keypair = ref.watch(webSessionProvider).keypair;

    return Stack(
      children: [
        // Align(
        //   alignment: Alignment.bottomRight,
        //   child: Opacity(
        //     opacity: 0.5,
        //     child: Image.asset(
        //       Assets.images.decorBottomRight.path,
        //       width: 300,
        //       height: 300,
        //       fit: BoxFit.contain,
        //     ),
        //   ),
        // ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.black,
                child: Center(
                  child: Container(
                    color: Colors.black,
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      Assets.images.animatedCube.path,
                      scale: 1,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: Image.asset(
              //     Assets.images.rbxWallet.path,
              //     width: 120,
              //     height: 20,
              //     fit: BoxFit.contain,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: WebWordmark(),
              ),
              const Text(
                APP_VERSION,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    label: "Create Wallet",
                    icon: Icons.add,
                    onPressed: () {
                      // AuthModal.show(
                      //     context: context,
                      //     onValidSubmission: (auth) async {
                      //       await handleCreateWithEmail(
                      //         context,
                      //         ref,
                      //         auth.email,
                      //         auth.password,
                      //       );
                      //       if (ref.read(webSessionProvider).isAuthenticated) {
                      //         redirectToDashboard();
                      //       }
                      //     });

                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return AuthTypeModal(
                            handleMneumonic: () async {
                              final success =
                                  await ConfirmDialog.show(title: 'Mneumonic', body: 'Are you sure you want to create a Mneumonic wallet?');
                              if (success == true) {
                                await handleCreateWithMnemonic(context, ref);
                                if (ref.read(webSessionProvider).isAuthenticated) {
                                  redirectToDashboard();
                                }
                              }
                            },
                            handleUsername: () {
                              AuthModal.show(
                                  context: context,
                                  onValidSubmission: (auth) async {
                                    await handleCreateWithEmail(
                                      context,
                                      ref,
                                      auth.email,
                                      auth.password,
                                    );
                                    if (ref.read(webSessionProvider).isAuthenticated) {
                                      redirectToDashboard();
                                    }
                                  });
                            },
                          );
                        },
                      );
                    },
                    variant: AppColorVariant.Light,
                  ),
                  const SizedBox(width: 8),
                  AppButton(
                    label: "Login",
                    icon: Icons.upload,
                    onPressed: () {
                      // AuthModal.show(
                      //   context: context,
                      //   forCreate: false,
                      //   onValidSubmission: (auth) async {
                      //     await handleCreateWithEmail(context, ref, auth.email, auth.password, false);

                      //     if (ref.read(webSessionProvider).isAuthenticated) {
                      //       redirectToDashboard();
                      //     }
                      //   },
                      // );

                      showModalBottomSheet(
                        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                        context: context,
                        builder: (context) {
                          return AuthTypeModal(
                            handleMneumonic: () async {
                              await handleRecoverFromMnemonic(context, ref);

                              if (ref.read(webSessionProvider).isAuthenticated) {
                                redirectToDashboard();
                              }

                              //do stuff
                            },
                            handleUsername: () {
                              AuthModal.show(
                                context: context,
                                forCreate: false,
                                onValidSubmission: (auth) async {
                                  await handleCreateWithEmail(context, ref, auth.email, auth.password, false);

                                  if (ref.read(webSessionProvider).isAuthenticated) {
                                    redirectToDashboard();
                                  }
                                },
                              );
                            },
                            handlePrivateKey: (context) async {
                              await handleImportWithPrivateKey(context, ref).then((value) {
                                if (ref.read(webSessionProvider).isAuthenticated) {
                                  redirectToDashboard();
                                }
                              });
                              // await Future.delayed(const Duration(milliseconds: 300));
                            },
                          );
                        },
                      );
                    },
                    variant: AppColorVariant.Light,
                  ),
                ],
              ),
              if (keypair != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: AppButton(
                    label: "Resume Session",
                    variant: AppColorVariant.Light,
                    type: AppButtonType.Text,
                    underlined: true,
                    onPressed: () {
                      redirectToDashboard();
                    },
                  ),
                ),
              if (Env.isTestNet)
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "TESTNET",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green, letterSpacing: 2),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
