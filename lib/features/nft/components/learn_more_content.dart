import 'package:flutter/material.dart';

class LearnMoreStep {
  final String title;
  final String description;

  const LearnMoreStep({
    required this.description,
    required this.title,
  });
}

class LearnMoreContent extends StatelessWidget {
  final List<LearnMoreStep> steps;
  final Function() onCreate;
  const LearnMoreContent({
    Key? key,
    required this.steps,
    required this.onCreate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: steps.asMap().entries.map((entry) {
          final step = entry.value;
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white30, width: 2),
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(.25),
                    spreadRadius: 4,
                    blurRadius: 5,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "${entry.key + 1}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        step.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    Text(
                      step.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
