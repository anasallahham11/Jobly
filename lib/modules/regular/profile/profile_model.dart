class EmployeeProfile {
    bool status;
    String message;
    Data data;

    EmployeeProfile({
        required this.status,
        required this.message,
        required this.data,
    });

    factory EmployeeProfile.fromJson(Map<String, dynamic> json) {
        return EmployeeProfile(
            status: json['status'],
            message: json['message'],
            data: Data.fromJson(json['data']),
        );
    }
}

class Data {
    int id;
    String name;
    String email;
    int role;
    int authentication;
    int ban;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    Employee employee;
    dynamic address;

    Data({
        required this.id,
        required this.name,
        required this.email,
        required this.role,
        required this.authentication,
        required this.ban,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.employee,
        required this.address,
    });

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            id: json['id'],
            name: json['name'],
            email: json['email'],
            role: json['role'],
            authentication: json['authentication'],
            ban: json['ban'],
            emailVerifiedAt: json['emailVerifiedAt'],
            createdAt: DateTime.parse(json['created_at']),
            updatedAt: DateTime.parse(json['updated_at']),
            employee: Employee.fromJson(json['employee']),
            address: json['address'],
        );
    }
}

class Employee {
    int id;
    int userId;
    dynamic cv;
    DateTime dateOfBirth;
    String resume;
    String experience;
    String education;
    String portfolio;
    String phoneNumber;
    String workStatus;
    String graduationStatus;
    DateTime createdAt;
    DateTime updatedAt;
    Image image;
    Video video;
    List<dynamic> skills;

    Employee({
        required this.id,
        required this.userId,
        required this.cv,
        required this.dateOfBirth,
        required this.resume,
        required this.experience,
        required this.education,
        required this.portfolio,
        required this.phoneNumber,
        required this.workStatus,
        required this.graduationStatus,
        required this.createdAt,
        required this.updatedAt,
        required this.image,
        required this.video,
        required this.skills,
    });

    factory Employee.fromJson(Map<String, dynamic> json) {
        return Employee(
            id: json['id'],
            userId: json['user_id'],
            cv: json['cv'],
            dateOfBirth: DateTime.parse(json['date_of_birth']),
            resume: json['resume'],
            experience: json['experience'],
            education: json['education'],
            portfolio: json['portfolio'],
            phoneNumber: json['phone_number'],
            workStatus: json['work_status'],
            graduationStatus: json['graduation_status'],
            createdAt: DateTime.parse(json['created_at']),
            updatedAt: DateTime.parse(json['updated_at']),
            image: Image.fromJson(json['image']),
            video: Video.fromJson(json['video']),
            skills: List<dynamic>.from(json['skills']),
        );
    }
}

class Image {
    int id;
    String filename;
    int imageableId;
    String imageableType;
    DateTime createdAt;
    DateTime updatedAt;

    Image({
        required this.id,
        required this.filename,
        required this.imageableId,
        required this.imageableType,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Image.fromJson(Map<String, dynamic> json) {
        return Image(
            id: json['id'],
            filename: json['filename'],
            imageableId: json['imageable_id'],
            imageableType: json['imageable_type'],
            createdAt: DateTime.parse(json['created_at']),
            updatedAt: DateTime.parse(json['updated_at']),
        );
    }
}

class Video {
    int id;
    String filename;
    int videoableId;
    String videoableType;
    DateTime createdAt;
    DateTime updatedAt;

    Video({
        required this.id,
        required this.filename,
        required this.videoableId,
        required this.videoableType,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Video.fromJson(Map<String, dynamic> json) {
        return Video(
            id: json['id'],
            filename: json['filename'],
            videoableId: json['videoable_id'],
            videoableType: json['videoable_type'],
            createdAt: DateTime.parse(json['created_at']),
            updatedAt: DateTime.parse(json['updated_at']),
        );
    }
}
