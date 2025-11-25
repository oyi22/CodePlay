// import 'dart:isolate';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import '../data/syntax_lab_levels.dart';

// class SintaxLabController extends ChangeNotifier{
//   int currentLevel = 1;
//   int score = 0;
//   int attempts = 3;

//   List<String> avaibleBlocks = [];
//   final List<String> droppedBlocks = [];
//   final Map<int, LevelData> levels = {
//     1: LevelData(
//       title: "level 1: fungsi sederhana",
//       description: "susun kode untuk membuat fungdi yang mengembalikan 'hello world'",
//       expectedOutput: "hello world!",
//       correctBloks: [
//         "function sayHello(){",
//         "   return 'hello world';",
//         "}",
//         "console.log(sayHello());"
//       ],
//       wrongBloks: [
//         "var x = 10;",
//         "return false:",
//         "if(true){",
//         "console.log('salah');"
//       ],
//       hint: "mulai dengan deklarasi fungsi, lalu isi fungsi, tutup dengan kurung kurawal dan panggil fungsinya"
//     ), 
//     2: LevelData(
//       title: "Level 2: Loop Kondisi", 
//       description: "susun kode untuk loop yang mencetak angka 1 sampai 3", 
//       expectedOutput: "1\n2\n3", 
//       correctBloks: [
//         "for (let i = 1;, i<=3; i++){",
//         "   console.log(1);",
//         "}",
//         "//loop selesai"
//       ], 
//       wrongBloks: [
//         "if (true){",
//         "   break:",
//         "let i = 0;",
//         "i++",
//         "while(false){",
//         "console.log('error');"
//       ], 
//       hint: "struktur  for loop:  deklarasi, kondisi, increment lalu body loop di dalam kurung kurawal"
//       ),
//     3: LevelData(
//       title: "Level 3: Array  dan Method", 
//       description: "susun kode  untuk membuat  array, menambah element dan menampilkan hasil", 
//       expectedOutput: "[1, 2, 3, 4]", 
//       correctBloks: [
//         "let number = [1, 2, 3, 4];",
//         "numbers.push(4);",
//         "console.log(numbers);",
//         "// array berhasil di modifikasi"
//       ], 
//       wrongBloks: [
//         "numbers.pop();",
//         "let result = [];",
//         "numbers[0] = 0;",
//         "return numbers;",
//         "number.splice(0, 1);",
//         "console.log('error');"
//       ], 
//       hint: "Buat arrray  dengan let, tambah elemen dengan push() lalu tampilkan hasil dengan console.log"
//       ),
//     4: LevelData(
//       title: "Level 4: conditional statement", 
//       description: "susun kode untuk mengecek apakah angka lebih besar dari 5", 
//       expectedOutput: "angka lebih besar  dari 5", 
//       correctBloks: [
//         "let num = 8;",
//         "if (num > 5){",
//         "   console.log('angka lebih besar dari 5');",
//         "}"
//       ], 
//       wrongBloks: [
//         "else {",
//         "   console.log('angka kecil');",
//         "let num = 3;",
//         "if (num < 5){",
//         "while (num > 5){",
//         "console.log('wrong')"
//       ], 
//       hint: "deklarasikam  variabel dengan  nilai > 5, lalu gunakan if statement unruk mengecek kondisi"
//       ),
//     5: LevelData(
//       title: "Level 5: Objent dan property", 
//       description: "susun kode untuk membuat  object dan mengakses properti", 
//       expectedOutput: "John", 
//       correctBloks: [
//         "let person = {",
//         "     name: 'john',",
//         "     age: 25,",
//         "}",
//         "console.log(person.name);"
//       ], 
//       wrongBloks: [
//         "console.log(person.name);",
//         "let person = [];",
//         "name: 'jane,",
//         "person.push('john');",
//         "delete person.name;",
//         "console.log(person[0]);"
//       ], 
//       hint: "buat  object dengan  kurung  kurawal, definisikan property name dan age, lalu akses name dengan dot notation!"
//       ),
//   };

//   SyntaxLabController(){
//     loadLevel(currentLevel);
//   }

//   LevelData get currentLevelData => levels[currentLevel]!;
//   void loadLevel(int level){
//     currentLevel = level;
//     attempts = 3;
//     droppedBlocks.clear();
//     final data = levels[level]!;
//     avaibleBlocks = [...data.correctBloks, ...data.wrongBloks];
//     avaibleBlocks.shuffle(Random());
//     notifyListeners();
//   }

//   void dropBlock(String code){
//     droppedBlocks.add(code);
//     avaibleBlocks.remove(code);
//     notifyListeners();
//   }

//   void removeDroppedBlockAt(int index){
//     final removed = droppedBlocks.removeAt(index);
//     avaibleBlocks.add(removed);
//     notifyListeners();
//   }

//   String checkAnswer(){
//     final correct = currentLevelData.correctBloks;
//     if (droppedBlocks.length != correct.length){
//       attempts--;
//       notifyListeners();
//       return "jumlah blok tidak sesuai kesempatan tersisa : $attempts";
//     }
//     final isCorrect = List.generate(correct.length, (i)=> droppedBlocks[i] == correct[i]).every((v)=> v == true);

//     if (isCorrect){
//       score += currentLevel * 100;
//       notifyListeners();
//       return "WIN";
//     } else {
//       attempts--;
//       notifyListeners();
//       return "Salah! kesempatan tersisa $attempts";
//     }
//   }
  
//   void resetVisibleBlocks(){
//     final lvl = currentLevel;
//     loadLevel(lvl);
//   }

//   bool isGameOver() => attempts <=0;

//   void nextLevelOrRestart(){
//     if(currentLevel >= levels.length){
//       currentLevel = 1;
//       score = 0;
//       attempts = 3;
//       loadLevel(1);
//     } else {
//       loadLevel(currentLevel + 1);
//     } notifyListeners();
//   }

//   void restartGame(){
//     currentLevel = 1;
//     score = 0;
//     attempts = 3;
//     loadLevel(1);
//     notifyListeners();
//   }
// }