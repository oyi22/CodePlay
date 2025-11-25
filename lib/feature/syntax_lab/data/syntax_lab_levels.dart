class SyntaxLabLevel {
  final int levelNumber;
  final String title;
  final String description;
  final String expectedOutput;
  final List<String> correctBlocks;
  final List<String> wrongBlocks;
  final String hint;

  SyntaxLabLevel({
    required this.levelNumber,
    required this.title,
    required this.description,
    required this.expectedOutput,
    required this.correctBlocks,
    required this.wrongBlocks,
    required this.hint,
  });
}

class SyntaxLabData {
  static final List<SyntaxLabLevel> levels = [
    SyntaxLabLevel(
      levelNumber: 1,
      title: "Level 1: Fungsi Sederhana",
      description: "Susun kode untuk membuat fungsi yang mengembalikan 'Hello World!'",
      expectedOutput: "Hello World!",
      correctBlocks: [
        "function sayHello() {",
        "    return 'Hello World!';",
        "}",
        "console.log(sayHello());"
      ],
      wrongBlocks: [
        "var x = 10;",
        "return false;",
        "if (true) {",
        "console.log('Wrong!');"
      ],
      hint: "Mulai dengan deklarasi fungsi, lalu isi fungsi, tutup kurung kurawal, dan panggil fungsi",
    ),
    SyntaxLabLevel(
      levelNumber: 2,
      title: "Level 2: Loop dan Kondisi",
      description: "Susun kode untuk loop yang mencetak angka 1 sampai 3",
      expectedOutput: "1\n2\n3",
      correctBlocks: [
        "for (let i = 1; i <= 3; i++) {",
        "    console.log(i);",
        "}",
        "// Loop selesai"
      ],
      wrongBlocks: [
        "if (true) {",
        "    break;",
        "let i = 0;",
        "i++",
        "while (false) {",
        "console.log('error');"
      ],
      hint: "Struktur for loop: deklarasi, kondisi, increment, lalu body loop di dalam kurung kurawal",
    ),
    SyntaxLabLevel(
      levelNumber: 3,
      title: "Level 3: Array dan Method",
      description: "Susun kode untuk membuat array, menambah elemen, dan menampilkan hasil",
      expectedOutput: "[1, 2, 3, 4]",
      correctBlocks: [
        "let numbers = [1, 2, 3];",
        "numbers.push(4);",
        "console.log(numbers);",
        "// Array berhasil dimodifikasi"
      ],
      wrongBlocks: [
        "numbers.pop();",
        "let result = [];",
        "numbers[0] = 0;",
        "return numbers;",
        "numbers.splice(0, 1);",
        "console.log('error');"
      ],
      hint: "Buat array dengan let, tambah elemen dengan push(), lalu tampilkan hasilnya dengan console.log",
    ),
    SyntaxLabLevel(
      levelNumber: 4,
      title: "Level 4: Conditional Statement",
      description: "Susun kode untuk mengecek apakah angka lebih besar dari 5",
      expectedOutput: "Angka lebih besar dari 5",
      correctBlocks: [
        "let num = 8;",
        "if (num > 5) {",
        "    console.log('Angka lebih besar dari 5');",
        "}"
      ],
      wrongBlocks: [
        "else {",
        "    console.log('Angka kecil');",
        "let num = 3;",
        "if (num < 5) {",
        "while (num > 5) {",
        "console.log('Wrong!');"
      ],
      hint: "Deklarasi variabel dengan nilai > 5, lalu gunakan if statement untuk mengecek kondisi",
    ),
    SyntaxLabLevel(
      levelNumber: 5,
      title: "Level 5: Object dan Property",
      description: "Susun kode untuk membuat object dan mengakses properti",
      expectedOutput: "John",
      correctBlocks: [
        "let person = {",
        "    name: 'John',",
        "    age: 25",
        "};",
        "console.log(person.name);"
      ],
      wrongBlocks: [
        "console.log(person.age);",
        "let person = [];",
        "name: 'Jane',",
        "person.push('John');",
        "delete person.name;",
        "console.log(person[0]);"
      ],
      hint: "Buat object dengan kurung kurawal, definisikan property name dan age, lalu akses name dengan dot notation",
    ),
  ];
}