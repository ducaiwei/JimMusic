
class MusicResponse<T> {
  bool? hasTaste;
  int? code;
  int? category;
  List<T>? result;
  MusicResponse(this.hasTaste, this.code, this.category, this.result);
}