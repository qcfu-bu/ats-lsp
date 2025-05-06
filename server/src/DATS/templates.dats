#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"

#staload "./../SATS/templates.sats"

#impltmp g_repr<string>(x0) = x0
#impltmp g_repr<int>(x0) =
  JS_number_repr(x0) 
  where {
    #extern fun
    JS_number_repr(x0: int): string = $extnam()
  }

#impltmp<> gs_repr$beg() = ""
#impltmp<> gs_repr$sep() = ""
#impltmp<> gs_repr$end() = ""

#impltmp
<>
gs_repr_a0() =
  gs_repr$beg() + gs_repr$end()

#impltmp
< x0:t0 >
gs_repr_a1(x0) =
  gs_repr$beg()  
  + g_repr<x0>(x0) + gs_repr$end()

#impltmp
< x0:t0 >
< x1:t0 >
gs_repr_a2(x0, x1) =
  gs_repr$beg()  
  + g_repr<x0>(x0) + gs_repr$sep()  
  + g_repr<x1>(x1) + gs_repr$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
gs_repr_a3(x0, x1, x2) =
  gs_repr$beg()
  + g_repr<x0>(x0) + gs_repr$sep()
  + g_repr<x1>(x1) + gs_repr$sep()
  + g_repr<x2>(x2) + gs_repr$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
gs_repr_a4(x0, x1, x2, x3) =
  gs_repr$beg() 
  + g_repr<x0>(x0) + gs_repr$sep()
  + g_repr<x1>(x1) + gs_repr$sep()
  + g_repr<x2>(x2) + gs_repr$sep()
  + g_repr<x3>(x3) + gs_repr$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
gs_repr_a5(x0, x1, x2, x3, x4) =
  gs_repr$beg()
  + g_repr<x0>(x0) + gs_repr$sep()
  + g_repr<x1>(x1) + gs_repr$sep()
  + g_repr<x2>(x2) + gs_repr$sep()
  + g_repr<x3>(x3) + gs_repr$sep()
  + g_repr<x4>(x4) + gs_repr$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
gs_repr_a6(x0, x1, x2, x3, x4, x5) =
  gs_repr$beg()
  + g_repr<x0>(x0)+ gs_repr$sep()
  + g_repr<x1>(x1)+ gs_repr$sep()
  + g_repr<x2>(x2)+ gs_repr$sep()
  + g_repr<x3>(x3)+ gs_repr$sep()
  + g_repr<x4>(x4)+ gs_repr$sep()
  + g_repr<x5>(x5)+ gs_repr$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
gs_repr_a7(x0, x1, x2, x3, x4, x5, x6) =
  gs_repr$beg()
  + g_repr<x0>(x0)+ gs_repr$sep()
  + g_repr<x1>(x1)+ gs_repr$sep()
  + g_repr<x2>(x2)+ gs_repr$sep()
  + g_repr<x3>(x3)+ gs_repr$sep()
  + g_repr<x4>(x4)+ gs_repr$sep()
  + g_repr<x5>(x5)+ gs_repr$sep()
  + g_repr<x6>(x6)+ gs_repr$end()

#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
gs_repr_a8(x0, x1, x2, x3, x4, x5, x6, x7) =
  gs_repr$beg()
  + g_repr<x0>(x0)+ gs_repr$sep()
  + g_repr<x1>(x1)+ gs_repr$sep()
  + g_repr<x2>(x2)+ gs_repr$sep()
  + g_repr<x3>(x3)+ gs_repr$sep()
  + g_repr<x4>(x4)+ gs_repr$sep()
  + g_repr<x5>(x5)+ gs_repr$sep()
  + g_repr<x6>(x6)+ gs_repr$sep()
  + g_repr<x7>(x7)+ gs_repr$end()

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
gs_repr_a9(x0, x1, x2, x3, x4, x5, x6, x7, x8) =
  gs_repr$beg()
  + g_repr<x0>(x0)+ gs_repr$sep()
  + g_repr<x1>(x1)+ gs_repr$sep()
  + g_repr<x2>(x2)+ gs_repr$sep()
  + g_repr<x3>(x3)+ gs_repr$sep()
  + g_repr<x4>(x4)+ gs_repr$sep()
  + g_repr<x5>(x5)+ gs_repr$sep()
  + g_repr<x6>(x6)+ gs_repr$sep()
  + g_repr<x7>(x7)+ gs_repr$sep()
  + g_repr<x8>(x8)+ gs_repr$end()

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
gs_repr_a10( x0, x1, x2, x3, x4, x5, x6, x7, x8, x9) =
  gs_repr$beg()
  + g_repr<x0>(x0)+ gs_repr$sep()
  + g_repr<x1>(x1)+ gs_repr$sep()
  + g_repr<x2>(x2)+ gs_repr$sep()
  + g_repr<x3>(x3)+ gs_repr$sep()
  + g_repr<x4>(x4)+ gs_repr$sep()
  + g_repr<x5>(x5)+ gs_repr$sep()
  + g_repr<x6>(x6)+ gs_repr$sep()
  + g_repr<x7>(x7)+ gs_repr$sep()
  + g_repr<x8>(x8)+ gs_repr$sep()
  + g_repr<x9>(x9)+ gs_repr$end()

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
gs_repr_a11(x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10) =
  gs_repr$beg()
  + g_repr<x0>(x0)+ gs_repr$sep()
  + g_repr<x1>(x1)+ gs_repr$sep()
  + g_repr<x2>(x2)+ gs_repr$sep()
  + g_repr<x3>(x3)+ gs_repr$sep()
  + g_repr<x4>(x4)+ gs_repr$sep()
  + g_repr<x5>(x5)+ gs_repr$sep()
  + g_repr<x6>(x6)+ gs_repr$sep()
  + g_repr<x7>(x7)+ gs_repr$sep()
  + g_repr<x8>(x8)+ gs_repr$sep()
  + g_repr<x9>(x9)+ gs_repr$sep()
  + g_repr<x10>(x10)+ gs_repr$end()

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
gs_repr_a12( 
  x0, x1, x2, x3, x4, x5, 
  x6, x7, x8, x9, x10, x11
) = gs_repr$beg()
  + g_repr<x0>(x0)+ gs_repr$sep()
  + g_repr<x1>(x1)+ gs_repr$sep()
  + g_repr<x2>(x2)+ gs_repr$sep()
  + g_repr<x3>(x3)+ gs_repr$sep()
  + g_repr<x4>(x4)+ gs_repr$sep()
  + g_repr<x5>(x5)+ gs_repr$sep()
  + g_repr<x6>(x6)+ gs_repr$sep()
  + g_repr<x7>(x7)+ gs_repr$sep()
  + g_repr<x8>(x8)+ gs_repr$sep()
  + g_repr<x9>(x9)+ gs_repr$sep()
  + g_repr<x10>(x10)+ gs_repr$sep()
  + g_repr<x11>(x11)+ gs_repr$end()