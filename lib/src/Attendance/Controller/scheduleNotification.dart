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
    BuildContext context = navigatorKey.currentContext!;
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

  static Future<List<String?>> supposedStartTime() async {
    //"2022-12-22 12:21:55"
    String serverDT = await AttendanceApiService().getServerTime();
    List<Attendance>? attendance = await AttendanceApiService().getAttendance();
    List<String?> supposedStartTime = [];
    List<String?> supposedEndTime = [];

    if (attendance != null) {
      for (int i = 0; i < attendance.length; i++) {
        if (userModel.employeeId == attendance[i].staff_id_) {
          String attendanceStartTime =
              attendance[i].shift_date_! + " " + attendance[i].supposed_start_!;
          String attendanceEndTime =
              attendance[i].shift_date_! + " " + attendance[i].supposed_end_!;
          supposedStartTime.add(attendanceStartTime);
          supposedEndTime.add(attendanceEndTime);
        }
      }
//[0]: "12/21/2022 5:22:00PM"
//[1]: "12/16/2022 1:00:00PM"
//[2]: "12/22/2022 10:47:00AM"
//Convert these to the format of 2022-12-22 10:47:00 //24 hour format
      for (int i = 0; i < supposedStartTime.length; i++) {
        //split Date Time
        List<String> splittedStart = supposedStartTime[i]!.split(" ");

        //Split Date into
        //Day
        //Month
        //Year
        List<String> splittedDate = splittedStart[0].split("/");
        //Rearrange into Year Month Day
        splittedStart[0] = splittedDate[2] +
            "-" +
            splittedDate[0] +
            "-" +
            splittedDate[1] +
            " ";
        //Split Time into Hour Minute Milliseconds
        List<String> splittedTime = splittedStart[1].split(":");

        //Splitted Time
        //[0] Hour
        //[1] Minute
        //[2] Millisecond
        if (splittedTime[2].contains("PM")) {
          splittedTime[0] = (int.parse(splittedStart[0]) + 12).toString();
        }
        //After converted to 24 hour format
        //Combine the Hour Minute Millisecond back
        splittedTime[i] = splittedTime[0] +
            ":" +
            splittedTime[1] +
            ":" +
            splittedTime[2].substring(0, 1);
      }
      //Can get a list of DateTime
      List<DateTime> supposedET =
          supposedStartTime.map((element) => DateTime.parse(element!)).toList();
    }

//[0]:"5:22:00PM"
//[1]:"1:00:00PM"
//[2]: "10:47:00AM"

    return supposedStartTime;
  }

  ///NOTIFICATION CREATION METHODS
  static Future<void> scheduleNewNotification() async {
    var shiftStartTime = supposedStartTime();
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;
    int startTime = 0;
    int localTime = 0;
    int valueA = 2;
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
  //Get Attendance ID, if got 2 attendance ID ,for loop twice to schedule 2 notifications;

  static Future<void> scheduleMultipleNotification() async {
    for (int i = 0; i < 5; i++) {
      scheduleNewNotification();
    }
  }
}
