class Validator {
  const Validator(this.name, this.content);

  final String name;
  final String? content;

  String? min(int num) {
    if (content != null && (content!.isEmpty || content!.length < num)) {
      return '$name should be atleast $num long';
    }
    return null;
  }

  String? required() {
    if (content != null && content!.isEmpty) {
      return '$name should not be empty';
    }
    return null;
  }
}
