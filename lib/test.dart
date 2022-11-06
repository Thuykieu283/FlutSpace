// enum Mode{
//   easy, normal, hard;
// }


// class Sensei {
//   String fname;
//   String lname;
//   factory Sensei.newSensei(){
//     return Sensei("", "", 0);
//   }
//   int yearsOfExperience = 0;
//   Sensei(this.fname, this.lname, this.yearsOfExperience);
//   void sayHi(){
//     print("Mina san kombanwa");
//   }
//   @override
//   bool operator ==(covariant Sensei s2) => s2.yearsOfExperience == yearsOfExperience;
//   @override
//   int get hashCode => yearsOfExperience.hashCode;
// }
// Future<int> returnNumber10(int a){
//   return Future.delayed(const Duration(seconds: 1), () => 10);
// }

// extension sayHi on Sensei{
//   void sayHii(){
//     print("Mina san kombanwa !");
//   }
//   void introducing(){
//     print("Watashi wa ${this.fname} ${this.lname} desu");
//   }
// }

// Stream<String> getHii(){
//   return Stream.periodic(const Duration(seconds: 2), (a) => '$a sai');
// }

// <Stream<Iterable<int>> getNums() async*{
//   yield [1,2,3];
//   yield [4,5,6];
//   yield [7,8,9];
//   yield [10,11,12];
// }

// void test() async{
//   final res = await returnNumber10(1);
//   print(res);
//   await for (final val in getNums()){
//     print(val);
//   }
// }


// void main(List<String> args) {
//   Sensei TTT = Sensei("TT","T", 4);
//   Sensei me = Sensei("Nguyen Nhu", "Dai", 4);
//   if(me == TTT) print("wow");
//   else print("Not so wow");
//   TTT.sayHii();
//   TTT.introducing();
//   test();
// }