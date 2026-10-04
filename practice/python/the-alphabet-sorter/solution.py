def alphabet_sorter(strings: list[str]) -> dict:

  result = {}

  for word in strings:
    letter = word[0].lower()

    if letter not in result:
      result[letter] = []

    result[letter].append(word)

  return result
