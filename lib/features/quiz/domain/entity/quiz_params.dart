class QuizParams {
  final int amount;
  final int? category;
  final String? difficulty;
  final String? type;

  const QuizParams({
    this.amount = 10,
    this.category,
    this.difficulty,
    this.type,
  });
}
