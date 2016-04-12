import 'dart:html';
import 'dart:convert';
//import 'package:js/js.dart' as js;
import 'package:intl/intl.dart';
import 'package:slideshow/slideshow.dart';
import 'package:slideshow/transition_simple.dart';
import 'package:polymer/polymer.dart';
//import 'dart:io';
//import 'package:polymer_elements/paper_button.dart';
//import 'package:polymer/polymer.dart';



InputElement toDoInput;
UListElement outputList;
ButtonElement clearAll;
var checkNotes;

void main() {
  querySelector('#chgText').text = 'Lets Program in Dart!';

  toDoInput = querySelector('#addItem');
  outputList = querySelector('#displayList');
  toDoInput.onChange.listen(toDoItemsList);
  clearAll = querySelector('#clearList');
  clearAll.onClick.listen((e) => outputList.children.clear());

  final Slideshow test = new Slideshow(
        document.body.querySelector("#notesImgsBox"),
        new TransitionSimple());
  test();
  //var readContents = new File('Notes.txt').readAsStringnSync();
  //querySelector('#displayNotes').text = readContents;
  //checkNotes = querySelector('#displayNotes');

  initPolymer().run(() {
    // The rest of the code in the main method.


    });


}

void toDoItemsList(Event e){
  var newToDo = new LIElement();
  newToDo.text = toDoInput.value;
  newToDo.onClick.listen((e) => newToDo.remove());
  toDoInput.value ='';
  outputList.children.add(newToDo);

}




/*
void makeRequest(Event e) {
  var path = 'https://www.dartlang.org/samples-files/portmanteaux.json';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {
    List<String> portmanteaux = JSON.decode(request.responseText);
    for (int i = 0; i < portmanteaux.length; i++) {
      wordList.children.add(new LIElement()..text = portmanteaux[i]);
    }
  } else {
    wordList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}
*/
