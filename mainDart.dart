import 'dart:html';
import 'dart:convert';
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
  var readContents = new File('Notes.txt').readAsStringnSync();

  querySelector('#displayNotes').text = readContents;
  //checkNotes = querySelector('#displayNotes');
  for (int i = 0; i < 3; i++){
    querySelector('#img'+i).style.display = 'none';
  }


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
