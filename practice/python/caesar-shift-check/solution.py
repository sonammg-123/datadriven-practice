def caesar_shift_check(a: str, b: str):
  if len(a) == 0:
    return True

  shift = (ord(b[0]) - ord(a[0])) % 26

  for i in range(len(a)):
    if (ord(b[i]) - ord(a[i])) % 26 != shift:
      return False

  return True
