import 'package:fluttertest/viewmodels/facts/fact-viewModel.dart';
import 'package:fluttertest/Utils/theme/colors.dart';
import '../../../widgets/button-custom.dart';
import '../../../widgets/image-view.dart';
import '../../../Utils/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../Utils/MasterURL.dart';

class FactDetailScreen extends StatefulWidget {
  final FactViewModel fact;

  const FactDetailScreen({Key? key, required this.fact}) : super(key: key);

  @override
  _FactDetailState createState() => _FactDetailState();
}

class _FactDetailState extends State<FactDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.colorSecondary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Detail", style: CustomTheme.appbarTitleStyle),
        toolbarHeight: 80,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: _body(widget.fact, context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _body(FactViewModel fact, BuildContext context) {
  return SingleChildScrollView(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 60,
      ),
      child: Column(
        children: [
          //Image Widget
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8), //border corner radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            margin:
                const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            width: double.infinity,
            height: 400,
            child: Stack(
              children: [
                CircleImage(
                  imageUrl: MasterURL.baseImageUrl + fact.imageURL,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: MyColors.colorSecondaryLight,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        fact.length.toString(),
                        style: CustomTheme.badgeTextStyle
                            .copyWith(color: MyColors.colorPrimaryDark),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Text Info(Fact) Widget
          Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
            padding: const EdgeInsets.all(20),
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
            child: Center(
              child: Text(
                fact.fact,
                style: CustomTheme.factTextStyle,
                textAlign: TextAlign.justify,
              ),
            ),
          ),

          //Button Widget
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const DefaultButton(
              text: "Back To List",
              mt: 0,
              mb: 10,
              ml: 10,
              mr: 10,
              pl: 10,
              pr: 10,
            ),
          ),
        ],
      ),
    ),
  );
}
