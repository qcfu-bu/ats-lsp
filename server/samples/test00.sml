datatype x = 
  | A of int
  | B of int

fun main() : int = 
  let 
    val x = 1
    val y = 2
  in x + y
  end

fun foo() : int = 
  let 
    val x = 1
    val y = 2
  in x + y
  end