import 'package:flutter/material.dart';

void main() {
  runApp(const Game());
}

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var x = '';
  bool isO = true;
  List<String> vals = ['','', '', '', '', '', '', '' ,''];
  @override
  Widget build(BuildContext context) {

    

   
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic tac toe"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 0, 23, 33),
      body: Center(
        child: GridView.builder(
            itemCount: 9,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap:(){

                  _tapped(index);
            

                },
                onDoubleTap:(){
                   double_tap(index);
                },
                child: Container(
                
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white10)),
                  child: Center(
                      child: Text(
                        // index.toString(),
                    vals[index],
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
                ),
              );
            }),
      ),
    );
    
  }
  void _tapped(int index){
      setState(() {
         if(isO){
           vals[index] = "O";

         }else{
           vals[index] ="X";
         }

         isO = !isO;
         checkwinner();
      });
    }

 void double_tap(int index){
   setState(() {
     vals[index] = "";
   });
 }

 void checkwinner(){
   //first row

   if(vals[0] == vals[1] && vals[0] == vals[2] && vals[0] != ""){
     showWinnerDialog(vals[0]);
   }

   //second row 

   if(vals[3] == vals[4] && vals[3] == vals[5] && vals[3] != ""){
     showWinnerDialog(vals[3]);
   }

   //third row
   if(vals[6] == vals[7] && vals[6] == vals[8] && vals[6] != ""){
     showWinnerDialog(vals[6]);
   }

   //first column

   if(vals[0] == vals[3] && vals[0] == vals[6] && vals[0] != ""){
     showWinnerDialog(vals[0]);
   }

   //second column

   if(vals[1] == vals[4] && vals[1] == vals[7] && vals[1] != ""){
     showWinnerDialog(vals[4]);
   }

   //third column

   if(vals[2] == vals[5] && vals[2] == vals[8] && vals[2] != ""){
     showWinnerDialog(vals[2]);
   }

   //first diagonal

   if(vals[0] == vals[4] && vals[0] == vals[8] && vals[0] != ""){
     showWinnerDialog(vals[0]);
   }
   //second diagonal

   if(vals[2] == vals[4] && vals[2] == vals[6] && vals[2] != ""){
     showWinnerDialog(vals[2]);
   }


 }

 void showWinnerDialog(String champ){

   showDialog(context: context, builder: (BuildContext context){
     return AlertDialog(title: Text("$champ is our winner!!!"),);


   });


 }
  
}
