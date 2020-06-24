
@test "basic search" {
  [ `grep "a" <<< "xxxaxxx"` ]
  [ ! `grep "a" <<< "bcd123!@#@<>?,./:;'"` ]
}

@test "BOL anchor" {
  [ `grep "^a" <<< "axxxxxx"` ]
  [ ! `grep "^a" <<< "bacada1a2a3a!a@a#a@a<a>a?a,a.a/a:a;a'a"` ]
  [ `grep "a^" <<< "xxxa^xxx"` ]
  [ ! `grep "a^" <<< "ab^acada1a2a3a!a@a#a@a<a>a?a,a.a/a:a;a'a"` ]
}

@test "EOL anchor" {
  [ `grep "a$" <<< "xxxxxxa"` ]
  [ ! `grep "a$" <<< "abacada1a2a3a!a@a#a@a<a>a?a,a.a/a:a;a'"` ]
  [ `grep "$a" <<< "xxx$axxx"` ]
  [ ! `grep "$a" <<< "a$bacada1a2a3a!a@a#a@a<a>a?a,a.a/a:a;a'a"` ]
}

@test "Both anchors" {
  [ `grep "^a.*a$" <<< "axxxxxxa"` ]
  [ ! `grep "^a.*a$" <<< "abacada1a2a3a!a@a#a@a<a>a?a,a.a/a:a;a'"` ]
  [ ! `grep "^a.*a$" <<< "bacada1a2a3a!a@a#a@a<a>a?a,a.a/a:a;a'a"` ]
}

@test "Dot" {
  [ `grep "." <<< "x"` ]
  [ `grep "." <<< "xx"` ]
}


