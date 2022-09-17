void main(List<String> args) {
  var filePath = p.join(Directory.current.path, 'assets', 'dictionary');
  File file = File(filePath);
  List<String> words = await file.readAsLines();
}