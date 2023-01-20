import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/app_constants.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_screen.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/env.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/singletons.dart';
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
    if (session.isAuthenticated) {
      if (currentPath == '') {
        AutoRouter.of(context).push(WebDashboardContainerRoute());
      }
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
                child: Text(
                  "RBX Web Wallet",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold, fontSize: isMobile ? 20 : 30),
                ),
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
                              final email = await PromptModal.show(
                                contextOverride: context,
                                title: "Email Address",
                                labelText: "Email",
                                validator: formValidatorEmail,
                              );

                              if (email == null || email.isEmpty) {
                                return;
                              }

                              await handleCreateWithMnemonic(context, ref, email);
                              if (ref.read(webSessionProvider).isAuthenticated) {
                                redirectToDashboard();
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
                              final email = await PromptModal.show(
                                contextOverride: context,
                                title: "Email Address",
                                labelText: "Email",
                                validator: formValidatorEmail,
                              );

                              if (email == null || email.isEmpty) {
                                return;
                              }

                              await handleRecoverFromMnemonic(context, ref, email);

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
                              final email = await PromptModal.show(
                                contextOverride: context,
                                title: "Email Address",
                                labelText: "Email",
                                validator: formValidatorEmail,
                              );

                              if (email == null || email.isEmpty) {
                                return;
                              }

                              await handleImportWithPrivateKey(context, ref, email);
                              await Future.delayed(const Duration(milliseconds: 300));

                              if (ref.read(webSessionProvider).isAuthenticated) {
                                redirectToDashboard();
                              }
                            },
                          );
                        },
                      );
                    },
                    variant: AppColorVariant.Light,
                  ),
                ],
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
