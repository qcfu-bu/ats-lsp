#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"

#staload "./../SATS/templates.sats"

#impltmp g_to_string<string>(x0) = x0
#impltmp g_to_string<int>(x0) =
  JS_number_to_string(x0) 
  where {
    #extern fun
    JS_number_to_string(x0: int): string = $extnam()
  }

#impltmp<> gs_to_string$beg() = ""
#impltmp<> gs_to_string$sep() = ""
#impltmp<> gs_to_string$end() = ""

#impltmp
<>
gs_to_string_a0() =
  gs_to_string$beg() + gs_to_string$end()

#impltmp
< x0:t0 >
gs_to_string_a1(x0) =
  gs_to_string$beg()  
  + g_to_string<x0>(x0) + gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
gs_to_string_a2(x0, x1) =
  gs_to_string$beg()  
  + g_to_string<x0>(x0) + gs_to_string$sep()  
  + g_to_string<x1>(x1) + gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
gs_to_string_a3(x0, x1, x2) =
  gs_to_string$beg()
  + g_to_string<x0>(x0) + gs_to_string$sep()
  + g_to_string<x1>(x1) + gs_to_string$sep()
  + g_to_string<x2>(x2) + gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
gs_to_string_a4(x0, x1, x2, x3) =
  gs_to_string$beg() 
  + g_to_string<x0>(x0) + gs_to_string$sep()
  + g_to_string<x1>(x1) + gs_to_string$sep()
  + g_to_string<x2>(x2) + gs_to_string$sep()
  + g_to_string<x3>(x3) + gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
gs_to_string_a5(x0, x1, x2, x3, x4) =
  gs_to_string$beg()
  + g_to_string<x0>(x0) + gs_to_string$sep()
  + g_to_string<x1>(x1) + gs_to_string$sep()
  + g_to_string<x2>(x2) + gs_to_string$sep()
  + g_to_string<x3>(x3) + gs_to_string$sep()
  + g_to_string<x4>(x4) + gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
gs_to_string_a6(x0, x1, x2, x3, x4, x5) =
  gs_to_string$beg()
  + g_to_string<x0>(x0)+ gs_to_string$sep()
  + g_to_string<x1>(x1)+ gs_to_string$sep()
  + g_to_string<x2>(x2)+ gs_to_string$sep()
  + g_to_string<x3>(x3)+ gs_to_string$sep()
  + g_to_string<x4>(x4)+ gs_to_string$sep()
  + g_to_string<x5>(x5)+ gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
gs_to_string_a7(x0, x1, x2, x3, x4, x5, x6) =
  gs_to_string$beg()
  + g_to_string<x0>(x0)+ gs_to_string$sep()
  + g_to_string<x1>(x1)+ gs_to_string$sep()
  + g_to_string<x2>(x2)+ gs_to_string$sep()
  + g_to_string<x3>(x3)+ gs_to_string$sep()
  + g_to_string<x4>(x4)+ gs_to_string$sep()
  + g_to_string<x5>(x5)+ gs_to_string$sep()
  + g_to_string<x6>(x6)+ gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
gs_to_string_a8(x0, x1, x2, x3, x4, x5, x6, x7) =
  gs_to_string$beg()
  + g_to_string<x0>(x0)+ gs_to_string$sep()
  + g_to_string<x1>(x1)+ gs_to_string$sep()
  + g_to_string<x2>(x2)+ gs_to_string$sep()
  + g_to_string<x3>(x3)+ gs_to_string$sep()
  + g_to_string<x4>(x4)+ gs_to_string$sep()
  + g_to_string<x5>(x5)+ gs_to_string$sep()
  + g_to_string<x6>(x6)+ gs_to_string$sep()
  + g_to_string<x7>(x7)+ gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
gs_to_string_a9(x0, x1, x2, x3, x4, x5, x6, x7, x8) =
  gs_to_string$beg()
  + g_to_string<x0>(x0)+ gs_to_string$sep()
  + g_to_string<x1>(x1)+ gs_to_string$sep()
  + g_to_string<x2>(x2)+ gs_to_string$sep()
  + g_to_string<x3>(x3)+ gs_to_string$sep()
  + g_to_string<x4>(x4)+ gs_to_string$sep()
  + g_to_string<x5>(x5)+ gs_to_string$sep()
  + g_to_string<x6>(x6)+ gs_to_string$sep()
  + g_to_string<x7>(x7)+ gs_to_string$sep()
  + g_to_string<x8>(x8)+ gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
gs_to_string_a10( x0, x1, x2, x3, x4, x5, x6, x7, x8, x9) =
  gs_to_string$beg()
  + g_to_string<x0>(x0)+ gs_to_string$sep()
  + g_to_string<x1>(x1)+ gs_to_string$sep()
  + g_to_string<x2>(x2)+ gs_to_string$sep()
  + g_to_string<x3>(x3)+ gs_to_string$sep()
  + g_to_string<x4>(x4)+ gs_to_string$sep()
  + g_to_string<x5>(x5)+ gs_to_string$sep()
  + g_to_string<x6>(x6)+ gs_to_string$sep()
  + g_to_string<x7>(x7)+ gs_to_string$sep()
  + g_to_string<x8>(x8)+ gs_to_string$sep()
  + g_to_string<x9>(x9)+ gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
< x10:t0 >
gs_to_string_a11(x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10) =
  gs_to_string$beg()
  + g_to_string<x0>(x0)+ gs_to_string$sep()
  + g_to_string<x1>(x1)+ gs_to_string$sep()
  + g_to_string<x2>(x2)+ gs_to_string$sep()
  + g_to_string<x3>(x3)+ gs_to_string$sep()
  + g_to_string<x4>(x4)+ gs_to_string$sep()
  + g_to_string<x5>(x5)+ gs_to_string$sep()
  + g_to_string<x6>(x6)+ gs_to_string$sep()
  + g_to_string<x7>(x7)+ gs_to_string$sep()
  + g_to_string<x8>(x8)+ gs_to_string$sep()
  + g_to_string<x9>(x9)+ gs_to_string$sep()
  + g_to_string<x10>(x10)+ gs_to_string$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
< x10:t0 >
< x11:t0 >
gs_to_string_a12( 
  x0, x1, x2, x3, x4, x5, 
  x6, x7, x8, x9, x10, x11
) = gs_to_string$beg()
  + g_to_string<x0>(x0)+ gs_to_string$sep()
  + g_to_string<x1>(x1)+ gs_to_string$sep()
  + g_to_string<x2>(x2)+ gs_to_string$sep()
  + g_to_string<x3>(x3)+ gs_to_string$sep()
  + g_to_string<x4>(x4)+ gs_to_string$sep()
  + g_to_string<x5>(x5)+ gs_to_string$sep()
  + g_to_string<x6>(x6)+ gs_to_string$sep()
  + g_to_string<x7>(x7)+ gs_to_string$sep()
  + g_to_string<x8>(x8)+ gs_to_string$sep()
  + g_to_string<x9>(x9)+ gs_to_string$sep()
  + g_to_string<x10>(x10)+ gs_to_string$sep()
  + g_to_string<x11>(x11)+ gs_to_string$end()