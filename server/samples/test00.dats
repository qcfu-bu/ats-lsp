#staload "./test00.sats"

datatype x_t = 
  | A of int
  | B of int

#abstype x <= p0tr
#absimpl x = x_t 

#abstype x <= p0tr

#extern fun main(): int

#implfun main() = 0

fun foo() : int = 
  let 
    val x = 1
    val y = 2
  in x + bar()
  end
  where {
    val x = 1
    val y = 2
  }