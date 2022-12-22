import 'dart:ffi';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/Attendance/Controller/AttendanceAPI.dart';
import 'package:hrms/src/Attendance/Model/attendance_information.dart';
import 'package:http/http.dart' as http;

class NotificationController {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static ReceivedAction? initialAction;

  ///initialization
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: 'alerts',
              channelName: 'Alerts',
              channelDescription: 'Check In/ Check Out',
              playSound: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.High,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple)
        ],
        debug: true);

    // Get initial notification action is optional
    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
  }

  ///  Notifications events are only delivered after call this method
  static Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  ///NOTIFICATION EVENTS

  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {
      // For background actions, you must hold the execution until the end
      print(
          'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
      await executeLongTaskInBackground();
    } else {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
          '/notification-page',
          (route) =>
              (route.settings.name != '/notification-page') || route.isFirst,
          arguments: receivedAction);
    }
  }

  /// Request notification access
  static Future<bool> displayNotificationRationale() async {
    bool userAuthorized = false;
    BuildContext? context = navigatorKey.currentContext;
    if (context != null) {
      await showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: Text('Get Notified!',
                  style: Theme.of(context).textTheme.titleLarge),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/animated-bell.gif',
                          height: MediaQuery.of(context).size.height * 0.3,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                      'Allow Awesome Notifications to send you beautiful notifications!'),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      'Deny',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () async {
                      userAuthorized = true;
                      Navigator.of(ctx).pop();
                    },
                    child: Text(
                      'Allow',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.deepPurple),
                    )),
              ],
            );
          });
    }
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  ///BACKGROUND TASKS TEST
  static Future<void> executeLongTaskInBackground() async {
    print("starting long task");
    await Future.delayed(const Duration(seconds: 4));
    final url = Uri.parse("http://google.com");
    final re = await http.get(url);
    print(re.body);
    print("long task done");
  }

  static Future<List<int>> supposedStartTime() async {
    //"2022-12-22 12:21:55"
    String serverDT = await AttendanceApiService().getServerTime();
    List<Attendance>? attendance = await AttendanceApiService().getAttendance();
    List<String?> supposedStartTime = [];
    List<String?> supposedEndTime = [];
    List<int> duration = [];

    if (attendance != null) {
      for (int i = 0; i < attendance.length; i++) {
        if (userModel.employeeId == attendance[i].staff_id_) {
          String attendanceStartTime =
              attendance[i].shift_date_! + " " + attendance[i].supposed_start_!;
          String attendanceEndTime =
              attendance[i].shift_date_! + " " + attendance[i].supposed_end_!;
          supposedStartTime.add(attendanceStartTime);
          supposedStartTime.add(attendanceEndTime);
        }
      }
//[0]: "12/21/2022 5:22:00PM"
//[1]: "12/16/2022 1:00:00PM"
//[2]: "12/22/2022 10:47:00AM"
//Convert these to the format of 2022-12-22 10:47:00 //24 hour format

      for (int i = 0; i < supposedStartTime.length; i++) {
        //[0]: "12/21/2022 5:22:00PM"
        String? current = supposedStartTime[i];

        //split Date Time
        //[0]: "12/21/2022"
        //[1]: "5:22:00PM"
        List<String> splittedDT = current!.split(" ");

        //SplittedDT : [0]: "12/21/2022"
        //Day [0] 12
        //Month [1] 21
        //Year [2] 2022
        List<String> splittedDate = splittedDT[0].split("/");
        //Rearrange into Year Month Day
        splittedDT[0] = splittedDate[2] +
            "-" +
            splittedDate[0] +
            "-" +
            splittedDate[1] +
            " ";
        //Split Time into Hour Minute Milliseconds
        List<String> splittedTime = splittedDT[1].split(":");

        //Splitted Time
        //[0] Hour
        //[1] Minute
        //[2] Millisecond
        if (splittedTime[2].contains("PM")) {
          int hour24 = int.parse(splittedTime[0]) + 12;
          splittedTime[0] = hour24.toString().padLeft(2, "0");
        }
        //After converted to 24 hour format
        //Combine the Hour Minute Millisecond back
        splittedTime[2] = splittedTime[2].substring(0, 2);
        String time = splittedTime[0].padLeft(2, "0") +
            ":" +
            splittedTime[1] +
            ":" +
            splittedTime[2];

        current = splittedDT[0] + time;
        supposedStartTime[i] = current;
      }
      //Can get a list of DateTime

      DateTime serverTime = DateTime.parse(serverDT);
      List<DateTime> supposedET =
          supposedStartTime.map((element) => DateTime.parse(element!)).toList();
      for (int i = 0; i < supposedStartTime.length; i++) {
        //shift - server time
        //12pm - 9am = 3 hour , set notification
        //if shift starts at 9am, then now 12pm , no need set
        if (!(supposedET[i].difference(serverTime).isNegative)) {
          List<DateTime> shiftInFuture = [];
          shiftInFuture.add(supposedET[i]);
          for (int j = 0; j < shiftInFuture.length; j++) {
            int secondValueTime =
                shiftInFuture[j].difference(serverTime).inSeconds;
            duration.add(secondValueTime);
          }
        }
      }
    }
    return duration;
  }

  ///NOTIFICATION CREATION METHODS
  static Future<void> scheduleNewNotification(List<int> durationTime) async {
    var shiftStartTime = supposedStartTime();
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;
    int startTime = 0;
    int localTime = 0;
    int valueA = 2;
    for (int i = 0; i < durationTime.length; i++) {
      valueA = durationTime[i];
      await AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: -1, // -1 is replaced by a random number
              channelKey: 'alerts',
              title: "Remember to Check In / Check Out your shift!",
              body: "Don't forget to Check In / Check Out for your shift!",
              bigPicture:
                  'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
              largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
              notificationLayout: NotificationLayout.BigPicture,
              payload: {'notificationId': '1234567890'}),
          actionButtons: [
            NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
            NotificationActionButton(
                key: 'DISMISS',
                label: 'Dismiss',
                actionType: ActionType.DismissAction,
                isDangerousOption: true)
          ],
          schedule: NotificationCalendar.fromDate(
              //valueA is the shift supposed start time - server current time AND
              //shift supposed end time - server time
              //Modulos to be positive value
              date: DateTime.now().add(Duration(seconds: valueA))));
    }
  }
  //Get Attendance ID, if got 2 attendance ID ,for loop twice to schedule 2 notifications;

  // static Future<void> scheduleMultipleNotification() async {
  //   for (int i = 0; i < 5; i++) {
  //     scheduleNewNotification();
  //   }
  // }
}
