import 'dart:html';
import 'dart:convert';
//import 'dart:io';
//import 'package:js/js.dart' as js;
/*
import 'package:intl/intl.dart';
import 'package:slideshow/slideshow.dart';
import 'package:slideshow/transition_.dart';
import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_input.dart';
*/


InputElement toDoInput;
InputElement takeInput;
UListElement outputList;
ButtonElement clearAll;
OutputElement showNum;

var checkNotes;

void main() {
  querySelector('#chgText').text = 'Lets Program in Dart!';

  toDoInput = querySelector('#addItem');
  outputList = querySelector('#displayList');
  toDoInput.onChange.listen(toDoItemsList);
  clearAll = querySelector('#clearList');
  clearAll.onClick.listen((e) => outputList.children.clear());

  /*final Slideshow test = new Slideshow(
        document.body.querySelector("#notesImgsBox"),
        new Transition()); */

  for (Element e in querySelectorAll('a')) {
    e.onClick.listen((e) => handleClick(e.target));
  }

    takeInput = querySelector('#num1');
    takeInput.onClick.listen(assignNumValues);
    //takeInput.onClick.listen(querySelector('#calcScreen'));

  //var readContents = new File('Notes.txt').readAsStringnSync();
  //querySelector('#displayNotes').text = readContents;
  //checkNotes = querySelector('#displayNotes');


}

void assignNumValues(Event e){
  var getValue = new LIElement();
  getValue.text = takeInput.value;
  //toDoInput.value ='';
  //outputList.children.add(newToDo);
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
