import 'dart:html';



InputElement toDoInput;
InputElement takeInput;
UListElement outputList;
ButtonElement clearAll;


void main() {
  querySelector('#chgText').text = 'Lets Program in Dart!';

  toDoInput = querySelector('#addItem');
  outputList = querySelector('#displayList');
  toDoInput.onChange.listen(toDoItemsList);
  clearAll = querySelector('#clearList');
  clearAll.onClick.listen((e) => outputList.children.clear());

}


void toDoItemsList(Event e){
  var newToDo = new LIElement();
  newToDo.text = toDoInput.value;
  newToDo.onClick.listen((e) => newToDo.remove());
  toDoInput.value ='';
  outputList.children.add(newToDo);

}
