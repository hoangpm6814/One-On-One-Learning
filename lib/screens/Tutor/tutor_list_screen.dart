import 'package:flutter/material.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/screens/Tutor/local_widgets/card_tutor.dart';
import 'package:lettutor/screens/Tutor/local_widgets/heading.dart';
import 'package:lettutor/constants.dart';
import 'package:provider/provider.dart';

class TutorListScreen extends StatefulWidget {
  static const routeName = '/tutor-list';

  @override
  State<TutorListScreen> createState() => _TutorListScreenState();
}

class _TutorListScreenState extends State<TutorListScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<TutorProvider>(context).fetchTutors().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final tutors = Provider.of<TutorProvider>(context).listTutor;
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            // height: (MediaQuery.of(context).size.height -
            //         (MediaQuery.of(context).padding.top +
            //             MediaQuery.of(context).padding.bottom +
            //             kToolbarHeight)) *
            //     0.26,
            height: 180,
            padding: const EdgeInsets.all(15.0),
            color: kPrimaryColor,
            child: Heading(),
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: (MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).padding.top +
                              MediaQuery.of(context).padding.bottom +
                              kToolbarHeight)) *
                      0.6,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return CardTutor(tutor: tutors[index]);
                    },
                    // itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                    //   value: tutors[index],
                    //   child: CardTutor(tutor: tutors[index]),
                    // ),
                    itemCount: tutors.length,
                  ),
                ),
        ],
      ),
    );
  }
}
