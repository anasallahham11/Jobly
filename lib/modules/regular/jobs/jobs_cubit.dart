import 'package:flutter_bloc/flutter_bloc.dart';
import 'jobs_states.dart';

class JobsCubit extends Cubit<JobsStates> {
  JobsCubit() : super(ForYouJobsState());

  static JobsCubit get(context) => BlocProvider.of(context);

  List<Map<String, String>> getCurrentList() {
    if (currentList == 'For You') {
      return yourJobs;
    } else {
      return allJobs;
    }
  }

  String currentList = 'For You';

  void changeIndex(String? value) {
    currentList = value ?? 'For You';
    if (currentList == 'For You') {
      emit(ForYouJobsState());
    } else {
      emit(AllJobsState());
    }
  }

  final List<Map<String, String>> yourJobs = [
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
      "title": "Software Engineer",
      "tag": "#1921",
      "time": "1 day ago",
      "role": "Developer",
      "level": "Mid Level",
      "experience": "3-5 years",
      "type": "Permanent",
      "salary": "\$120,000",
      "company": "Amazon",
      "location": "Seattle, WA"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
      "title": "Product Manager",
      "tag": "#1923",
      "time": "2 days ago",
      "role": "Manager",
      "level": "Senior Level",
      "experience": "5-7 years",
      "type": "Permanent",
      "salary": "\$150,000",
      "company": "Google",
      "location": "Mountain View, CA"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
      "title": "Chef",
      "tag": "#1900",
      "time": "3 days ago",
      "role": "Cook",
      "level": "Entry Level",
      "experience": "1-2 years",
      "type": "Temporary",
      "salary": "\$40,000",
      "company": "Burger King",
      "location": "New York, NY"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
      "title": "Designer",
      "tag": "#1933",
      "time": "4 days ago",
      "role": "Designer",
      "level": "Mid Level",
      "experience": "3-5 years",
      "type": "Permanent",
      "salary": "\$70,000",
      "company": "LEGO",
      "location": "Billund, Denmark"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
      "title": "Software Engineer",
      "tag": "#1921",
      "time": "1 day ago",
      "role": "Developer",
      "level": "Mid Level",
      "experience": "3-5 years",
      "type": "Permanent",
      "salary": "\$120,000",
      "company": "Amazon",
      "location": "Seattle, WA"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
      "title": "Product Manager",
      "tag": "#1923",
      "time": "2 days ago",
      "role": "Manager",
      "level": "Senior Level",
      "experience": "5-7 years",
      "type": "Permanent",
      "salary": "\$150,000",
      "company": "Google",
      "location": "Mountain View, CA"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
      "title": "Chef",
      "tag": "#1900",
      "time": "3 days ago",
      "role": "Cook",
      "level": "Entry Level",
      "experience": "1-2 years",
      "type": "Temporary",
      "salary": "\$40,000",
      "company": "Burger King",
      "location": "New York, NY"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
      "title": "Designer",
      "tag": "#1933",
      "time": "4 days ago",
      "role": "Designer",
      "level": "Mid Level",
      "experience": "3-5 years",
      "type": "Permanent",
      "salary": "\$70,000",
      "company": "LEGO",
      "location": "Billund, Denmark"
    }
  ];

  final List<Map<String, String>> allJobs = [
    {
      "image":
          "https://static.wixstatic.com/media/d2252d_4c1a1bda6a774bd68f789c0770fd16e5~mv2.png",
      "title": "Software Engineer",
      "tag": "#1921",
      "time": "1 day ago",
      "role": "Developer",
      "level": "Mid Level",
      "experience": "3-5 years",
      "type": "Permanent",
      "salary": "\$120,000",
      "company": "Amazon",
      "location": "Seattle, WA"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
      "title": "Product Manager",
      "tag": "#1923",
      "time": "2 days ago",
      "role": "Manager",
      "level": "Senior Level",
      "experience": "5-7 years",
      "type": "Permanent",
      "salary": "\$150,000",
      "company": "Google",
      "location": "Mountain View, CA"
    },
    {
      "image":
          "https://play-lh.googleusercontent.com/DIQzLQuHuupEoCe8TfpUdrsYDicq2cSE_WTsrZ-Ys6ppLHKdc7m5dbyqmQqiJi0JfQ",
      "title": "Chef",
      "tag": "#1900",
      "time": "3 days ago",
      "role": "Cook",
      "level": "Entry Level",
      "experience": "1-2 years",
      "type": "Temporary",
      "salary": "\$40,000",
      "company": "Burger King",
      "location": "New York, NY"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-oTCfJdO8zwDoyHB7j5tktdQq31w6t31GsA&s",
      "title": "Designer",
      "tag": "#1933",
      "time": "4 days ago",
      "role": "Designer",
      "level": "Mid Level",
      "experience": "3-5 years",
      "type": "Permanent",
      "salary": "\$70,000",
      "company": "LEGO",
      "location": "Billund, Denmark"
    },
    {
      "image":
          "https://static.wixstatic.com/media/d2252d_4c1a1bda6a774bd68f789c0770fd16e5~mv2.png",
      "title": "Software Engineer",
      "tag": "#1921",
      "time": "1 day ago",
      "role": "Developer",
      "level": "Mid Level",
      "experience": "3-5 years",
      "type": "Permanent",
      "salary": "\$120,000",
      "company": "Amazon",
      "location": "Seattle, WA"
    },
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
      "title": "Product Manager",
      "tag": "#1923",
      "time": "2 days ago",
      "role": "Manager",
      "level": "Senior Level",
      "experience": "5-7 years",
      "type": "Permanent",
      "salary": "\$150,000",
      "company": "Google",
      "location": "Mountain View, CA"
    },
    {
      "image":
          "https://play-lh.googleusercontent.com/DIQzLQuHuupEoCe8TfpUdrsYDicq2cSE_WTsrZ-Ys6ppLHKdc7m5dbyqmQqiJi0JfQ",
      "title": "Chef",
      "tag": "#1900",
      "time": "3 days ago",
      "role": "Cook",
      "level": "Entry Level",
      "experience": "1-2 years",
      "type": "Temporary",
      "salary": "\$40,000",
      "company": "Burger King",
      "location": "New York, NY"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-oTCfJdO8zwDoyHB7j5tktdQq31w6t31GsA&s",
      "title": "Designer",
      "tag": "#1933",
      "time": "4 days ago",
      "role": "Designer",
      "level": "Mid Level",
      "experience": "3-5 years",
      "type": "Permanent",
      "salary": "\$70,000",
      "company": "LEGO",
      "location": "Billund, Denmark"
    }
  ];



}
