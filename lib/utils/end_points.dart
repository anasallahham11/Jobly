///LOGIN & SIGN UP
const LOGIN = 'login/employee';
const LOGOUT = 'logout';
const SIGHNUPUSER = 'create/user';
const SIGHNUPEMPLOYY = 'employee/create/employee';
const SIGHNUPADDRESS= 'address/create';
const SIGHNUPSKILL= 'employee/create/skill';
const SIGHNUPADDFAV= 'employee/favorite/add';
const SIGHNUPGETCAT= 'category/index';
const SIGHNUPGETSUBCAT= 'section/getSectionByCaateogry/';

///PROFILE
const PROFILE = "employee/show";
///JOBS
const GET_COMPANIES_JOBS="vacancy/index/companies";
const GET_MY_JOBS="employee/vacancy/getFavorite";
const GET_COMPANIES="company/index";
const GET_JOB_DETAILS="vacancy/show";

///SEARCH & FILTER
const SEARCH="vacancy/search";
const GET_CATEGORIES="category/index";
const GET_SECTIONS="section/index";
const FILTER="vacancy/filter";

///APPLICATIONS
const APPLY_TO_JOB="vacancy/applyVacancy";
const GET_APPLICATIONS="employee/vacancy/getMyApplications";
const CANCEL_APPLICATION="ReqquestJobs/delete";

///QUESTIONS
const ADD_QUESTION = "question/create";
const DELETE_QUESTION = "question/delete";
const EDIT_QUESTION = "question/update";
const REPORT_QUESTION = "question/report";
const GET_QUESTIONS_LATEST = "question/indexByDate";
const GET_QUESTIONS_SECTION = "question/indexBySection";
const LIKE_QUESTION = "question/like";

///ANSWERS
const ADD_ANSWER = "answer";
const GET_ANSWERS = "answer";
const DELETE_ANSWER = "answer";
const EDIT_ANSWER = "answer/update";
const REPORT_ANSWER = "report/answer";
const LIKE_ANSWER = "answer/like";

///ADVICES
const ADD_ADVICE = "advice/create";
const GET_ADVICES_LIKED = "advice/indexByLike";
const GET_ADVICES_LATEST = "advice/indexByDate";
const DELETE_ADVICE = "advice/delete";
const EDIT_ADVICE = "advice/update";
const REPORT_ADVICE = "advice/report";
const LIKE_ADVICE = "advice/like";

///ANNOUNCEMENTS
const GET_ANNOUNCEMENTS = "announcement/index";
