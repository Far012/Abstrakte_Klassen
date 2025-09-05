import '../P11_Klassen/main.dart';

abstract class DatabaseRepository {
  void create(HomeworkDetails details); //statt (HomeworkDetails details) -> (var object)
  List<HomeworkDetails> read();

  void update(HomeworkDetails details);

  void delete(HomeworkDetails details);
}

class HomeworkDetailsDatabaseRepository implements DatabaseRepository {
  final List<HomeworkDetails> homeworkDetails = [];

  @override
  void create(HomeworkDetails details) {
    homeworkDetails.add(details);
    print("Aufgabe hinzugefügt: ${details.title}");
  }

  @override
  List<HomeworkDetails> read() {
    return homeworkDetails;
  }

  @override
  void update(HomeworkDetails details) {
    int index = homeworkDetails.indexWhere((d) => d.homeworkId == details.homeworkId);
    if (index != -1) {
      homeworkDetails[index] = details;
      print("Aufgabe aktualisiert: ${details.title}");
    } else {
      print("Aufgabe nicht gefunden: ${details.title}");
    }
  }

  @override
  void delete(HomeworkDetails details) {
    homeworkDetails.removeWhere((d) => d.homeworkId == details.homeworkId);
    print("Aufgabe gelöscht: ${details.title}");
  }
}
