String capitalize(String input) {
  if (input.length > 1) {
    return input[0].toUpperCase() + input.substring(1);
  }
  return input;
}

String splitWordsCapitalizing(String name) {
  return name.split('-').map((e) => capitalize(e)).join(' ');
}
