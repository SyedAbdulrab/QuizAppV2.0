class QuizQuestion {
  const QuizQuestion(this.text,this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    // we can shuffle here even though its a final variables because we're not reassigning it values rather we are simply editing the existing list in memory
    return shuffledList;
  }
}