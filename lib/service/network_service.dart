import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/task.dart';

final networkServiceProvider = ChangeNotifierProvider.autoDispose<NetworkService>((ref) {
  return NetworkService();
});

class NetworkService extends ChangeNotifier {
  Task? _taskDetail;
  int _navigatorItemIndex = 0;

  int get navigatorItemIndex => _navigatorItemIndex;

  Task? get taskDetail => _taskDetail;

  set taskDetail(Task? taskData) {
    _taskDetail = taskData;
    notifyListeners();
  }

  set navigatorItemIndex(int index) {
    _navigatorItemIndex = index;
    notifyListeners();
  }

  List<Task> getTasks()  {
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: 'Read emails from mailbox',
        dateTime: now,
        description:
            "The task involves reading emails from a designated mailbox. To accomplish this, a program or script can be implemented that connects to the mailbox using the appropriate email protocol (e.g., IMAP or POP3) and retrieves the emails. The program may need to handle authentication credentials securely and may also incorporate email parsing techniques to extract relevant information from the messages. The process can be automated and can be used for various purposes, such as data analysis, notification systems, or personal organization.",
      ),
      Task(
          id: '2',
          title: 'Check latest news on Flutter',
          dateTime: now,
          description:
              "Flutter was a popular open-source UI software development kit (SDK) created by Google. It enables developers to build natively compiled applications for mobile, web, and desktop from a single codebase. Flutter has gained significant traction in the development community due to its fast performance, expressive and flexible UI capabilities, and the ability to hot reload, allowing for quick development iterations.\nTo get the most recent news on Flutter, I recommend checking reliable tech news websites or the official Flutter website for updates and the latest developments beyond my knowledge cutoff date."),
      Task(
          id: '3',
          title: 'Have a call with Flutter team',
          dateTime: now,
          description:
              "The purpose of the upcoming call is to have a discussion with the Flutter team. Flutter is an open-source UI software development kit created by Google for building natively compiled applications for mobile, web, and desktop from a single codebase.\nDuring the call, we plan to cover various topics, including project updates, the Flutter team's roadmap and future plans, technical support, best practices, collaboration opportunities, and sharing feedback and suggestions for the platform.\nThe call aims to promote communication and collaboration, ensuring a seamless and productive development experience with the Flutter framework."),
      Task(
          id: '4',
          title: 'Work on application performance',
          dateTime: now,
          description:
              "Improving application performance is a critical aspect of software development aimed at enhancing responsiveness, efficiency, and user experience. It involves analyzing the current performance, optimizing code, databases, and algorithms, and conducting scalability and load testing. Additionally, addressing network and latency issues, optimizing user interface and experience, ensuring security, and enabling continuous monitoring and improvement are essential steps to achieve optimal application performance. By prioritizing performance, developers can create reliable, user-friendly applications that meet or exceed user expectations."),
      Task(
          id: '5',
          title: 'Plan work for next week',
          dateTime: now,
          description:
              "Next week's work plan focuses on optimizing productivity, ensuring project success, and supporting team well-being. Key elements include managing ongoing projects, fostering effective communication, and exploring new opportunities. Professional development and client engagement are prioritized. Administrative tasks will be handled, and a healthy work-life balance will be encouraged. Long-term planning and regular reflection will drive continuous improvement. The aim is to achieve goals efficiently, maintain a positive work culture, and promote individual and collective growth."),
      Task(
        id: '6',
        title: 'Order lunch',
        dateTime: now,
        description: "In response to the request "
            'Order lunch,'
            " an AI-powered system will assist the user in selecting and purchasing their desired meal for lunch. The AI will provide a range of food options, considering the user's preferences, dietary restrictions, and location. Using natural language processing, the system will engage in a conversation with the user to gather relevant information and refine the options. Once the user has made their selection, the AI will process the order, arrange for payment, and have the lunch delivered to the user's specified location, ensuring a convenient and satisfying lunchtime experience.",
      ),
      Task(
        id: '7',
        title: 'Create an invoice for last month',
        dateTime: now,
        description:
            "Creating an invoice for last month involves summarizing all billable transactions and presenting the total amount due to customers. The process includes gathering transaction data, verifying accuracy, calculating the total amount, applying payments and credits, checking for outstanding balances, assigning an invoice number and date, including payment terms, providing contact information, reviewing for accuracy, and sending the invoice to customers through an appropriate method.",
      ),
    ];
  }
}
