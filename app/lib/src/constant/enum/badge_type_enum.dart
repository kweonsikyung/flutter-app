enum BadgeType {
  NEW_BADGE(
    title: "NEW",
  ),
  HOT_BADGE(
    title: "HOT",
  );

  final String title;

  const BadgeType({
    required this.title,
  });
}
