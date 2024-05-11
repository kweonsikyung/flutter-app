enum TagType {
  ANIMAL(
    title: "#귀여운 동물",
  ),
  FAMILY(
    title: "#행복한 가족",
  ),
  FRIEND(title: "#소중한 친구");

  final String title;

  const TagType({
    required this.title,
  });
}
