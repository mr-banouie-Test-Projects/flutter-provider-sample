import 'package:fluttertest/screens/facts/detail/fact-details-screen.dart';
import 'package:fluttertest/viewmodels/facts/fact-viewModel.dart';
import '../../../widgets/image-view.dart';
import '../../../Utils/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../Utils/MasterURL.dart';

class FactRow extends StatelessWidget {
  final List<FactViewModel> facts;
  final ScrollController scrollController;

  FactRow({required this.facts, required this.scrollController});

  void _showFactDetails(BuildContext context, FactViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return FactDetailScreen(
        fact: vm,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: facts.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        final fact = facts[index];
        return GestureDetector(
          onTap: () {
            _showFactDetails(context, fact);
          },
          //Box
          child: Container(
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8), //border corner radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 1), // changes position of shadow
                ),
                //you can set more BoxShadow() here
              ],
            ),
            child: Row(
              children: [
                //Fact Image
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: CircleImage(
                      imageUrl: MasterURL.baseImageUrl + fact.imageURL,
                      key: Key("image_" + index.toString()),
                    ),
                  ),
                ),
                //Fact Right Block (Text And Icons)
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              child: Text(
                                "Items #$index",
                                style: CustomTheme.itemTitle,
                                textAlign: TextAlign.left,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              margin: const EdgeInsets.only(top: 5),
                              alignment: Alignment.center,
                              child: Text(
                                fact.fact,
                                style: CustomTheme.factTextStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Image(
                              height: 12,
                              image: AssetImage('assets/images/size-icon.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                fact.length.toString(),
                                style: CustomTheme.badgeTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
