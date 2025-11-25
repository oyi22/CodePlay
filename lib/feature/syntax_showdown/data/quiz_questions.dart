class QuizQuestion {
  final String code;
  final String language;
  final List<String> options;
  final String answer;

  QuizQuestion({
    required this.code,
    required this.language,
    required this.options,
    required this.answer,
  });
}

class QuizData {
  static final List<QuizQuestion> questions = [
    QuizQuestion(
      code: 'console.log([] + {});',
      language: 'JavaScript',
      options: ['[object Object]', '0', 'undefined', 'Error'],
      answer: '[object Object]',
    ),
    QuizQuestion(
      code: 'print("Hello" * 3)',
      language: 'Python',
      options: ['HelloHelloHello', 'Hello3', 'Error', 'Hello Hello Hello'],
      answer: 'HelloHelloHello',
    ),
    QuizQuestion(
      code: 'int x = 5; printf("%d", x++);',
      language: 'C',
      options: ['5', '6', 'Error', 'Random Value'],
      answer: '5',
    ),
    QuizQuestion(
      code: 'System.out.println(10 + 20 + "30");',
      language: 'Java',
      options: ['3030', '102030', '30', '6030'],
      answer: '3030',
    ),
    QuizQuestion(
      code: 'const x = [1, 2, 3]; x.push(4); console.log(x);',
      language: 'JavaScript',
      options: ['[1, 2, 3, 4]', 'Error', '[1, 2, 3]', 'undefined'],
      answer: '[1, 2, 3, 4]',
    ),
    QuizQuestion(
      code: 'print(type([]))',
      language: 'Python',
      options: ['<class \'list\'>', 'list', 'array', '<class \'array\'>'],
      answer: '<class \'list\'>',
    ),
    QuizQuestion(
      code: '#include <stdio.h>\nint main() { printf("%d", 5 / 2); }',
      language: 'C',
      options: ['2', '2.5', '3', 'Error'],
      answer: '2',
    ),
    QuizQuestion(
      code: 'String s = null; System.out.println(s.length());',
      language: 'Java',
      options: ['NullPointerException', '0', 'null', 'Error at compile'],
      answer: 'NullPointerException',
    ),
    QuizQuestion(
      code: 'console.log(typeof NaN);',
      language: 'JavaScript',
      options: ['number', 'NaN', 'undefined', 'object'],
      answer: 'number',
    ),
    QuizQuestion(
      code: 'print(1 == "1")',
      language: 'Python',
      options: ['False', 'True', 'Error', '1'],
      answer: 'False',
    ),
  ];
}