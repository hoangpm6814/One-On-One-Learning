import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_small_padding.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PickScheduleBottom extends StatefulWidget {
  final String tutorId;

  const PickScheduleBottom({
    Key key,
    this.tutorId,
  }) : super(key: key);
  @override
  State<PickScheduleBottom> createState() => _PickScheduleBottomState();
}

class _PickScheduleBottomState extends State<PickScheduleBottom> {
  final List<String> requestTitle = [
    'Pick your date:',
    'Pick your time',
  ];
  List<int> dates = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  List<int> shifts = [1, 2, 3, 4, 5, 6];

  int num = 0;
  int selectedDateDiff = 0;
  int selectedShift = 1;
  String requirement = 'aaa';
  final _form = GlobalKey<FormState>();
  // int shift = 0;
  // String selectedOption = '';

  Widget buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(
                side: BorderSide(
                  color: Theme.of(context).errorColor,
                ),
              ),
            ),
            onPressed: () => setState(() {
              num = 0;
              selectedDateDiff = 0;
              selectedShift = 1;
              Navigator.pop(context);
            }),
            child: Text(
              AppLocalizations.of(context).close,
              style: TextStyle(
                color: Theme.of(context).errorColor,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: kPrimaryColor,
            ),
            onPressed: () => setState(() {
              if (num >= requestTitle.length - 1) {
                // num = 0;
                final DateTime now = DateTime.now();
                final selectedDateToSubmit =
                    now.add(Duration(days: selectedDateDiff));
                String dateToShow =
                    DateFormat("EEE, dd/MM/yyyy").format(selectedDateToSubmit);
                int selectedShiftToSubmit = selectedShift;
                String shiftToShow =
                    getStringShiftFromShift(selectedShiftToSubmit);
                // show dialog here
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: Text(
                          AppLocalizations.of(context).schedule_this_tutor),
                      content: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Form(
                          key: _form,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                dateToShow,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                shiftToShow,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                AppLocalizations.of(context).requirement,
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: AppLocalizations.of(context)
                                      .write_down_requirement_booking,
                                ),
                                onSaved: (String value) {
                                  requirement = value;
                                },
                                keyboardType: TextInputType.multiline,
                                // maxLength: 200,
                                maxLines: 3,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  LightRoundedButtonSmallPadding(
                                    text: AppLocalizations.of(context)
                                        .schedule_now,
                                    press: () {
                                      // send data
                                      _form.currentState.save();
                                      Provider.of<ScheduleProvider>(context,
                                              listen: false)
                                          .createNewSchedule(
                                        Schedule(
                                          id: '6',
                                          studentId: '1',
                                          tutorId: widget.tutorId,
                                          date: selectedDateToSubmit,
                                          shift: selectedShiftToSubmit,
                                          requirement: requirement,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
                num = 0;
                selectedDateDiff = 0;
                selectedShift = 1;
                // Navigator.pop(context);
              } else {
                num++;
              }
            }),
            child: Text(
              AppLocalizations.of(context).submit,
            ),
          )
        ],
      );

  Widget buildChipDate(int option, BuildContext context) {
    final isSelected = selectedDateDiff == option;
    final foregroundColor = isSelected ? Colors.white : Colors.black;
    final backgroundColor = isSelected ? kPrimaryColor : Colors.white;
    return GestureDetector(
      onTap: () => setState(() {
        selectedDateDiff = option;
      }),
      child: Chip(
        shape: StadiumBorder(
          side: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        label: Text(
          getStringDateFromDateDiff(option),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: foregroundColor,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  Widget buildChipShift(int option, BuildContext context) {
    final isSelected = selectedShift == option;
    final foregroundColor = isSelected ? Colors.white : Colors.black;
    final backgroundColor = isSelected ? kPrimaryColor : Colors.white;
    return GestureDetector(
      onTap: () => setState(() {
        selectedShift = option;
      }),
      child: Chip(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: StadiumBorder(
          side: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        label: Text(
          getStringShiftFromShift(option),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: foregroundColor,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  String getStringDateFromDateDiff(int datediff) {
    final DateTime now = DateTime.now();
    return DateFormat("dd/MM/yyyy").format(now.add(Duration(days: datediff)));
  }

  String getStringShiftFromShift(int shift) {
    switch (shift) {
      case 1:
        return "08:00 - 09:30";
      case 2:
        return "09:30 - 11:00";
      case 3:
        return "13:30 - 15:00";
      case 4:
        return "15:00 - 16:30";
      case 5:
        return "20:00 - 21:30";
      case 6:
        return "21:30 - 23:00";
      default:
        return "21:30 - 23:00";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
      // height: 400,
      // color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            // requestTitle[num] == "Pick your date:"
            //     ? AppLocalizations.of(context).pick_your_date
            //     : AppLocalizations.of(context).pick_your_time,
            num == 0
                ? AppLocalizations.of(context).pick_your_date
                : AppLocalizations.of(context).pick_your_time,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          num == 0
              ? Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children:
                      dates.map((opt) => buildChipDate(opt, context)).toList(),
                )
              : Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: shifts
                      .map((opt) => buildChipShift(opt, context))
                      .toList(),
                ),
          const SizedBox(
            height: 10,
          ),
          buildButtons(),
        ],
      ),
    );
  }
}
