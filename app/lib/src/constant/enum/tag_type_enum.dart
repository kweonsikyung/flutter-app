enum TagType {
  animal(
    title: "#귀여운 동물",
  ),
  family(
    title: "#행복한 가족",
  ),
  friend(title: "#소중한 친구");

  final String title;

  const TagType({
    required this.title,
  });
}
