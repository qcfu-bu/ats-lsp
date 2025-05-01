// Thu May  1 18:28:10 EDT 2025
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
// HX-2024-06-22:
// ATS3-XANADU/srcgen2/xats2js/srcgen1
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.

'use strict';

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
let XATSTOP0 = undefined
//
////////////////////////////////////////////////////////////////////////.
//
let XATSINT0 = (i0) => i0
//
let XATSINT1 = (i0) => i0
let XATSBOOL = (b0) => b0
let XATSFLT1 = (f0) => f0
/*
let XATSSFLT = (sf) => sf
let XATSDFLT = (df) => df
*/
let XATSSTRN = (cs) => cs
//
let XATSCNUL = (  ) => (0)
let XATSCHAR = (ch) => ch.charCodeAt(0)
//
////////////////////////////////////////////////////////////////////////.
/*
HX: this is historic:
let XATSVAR0 = () => [null]
let XATSVAR1 = (init) => [init]
let XATSFLAT = (addr) => addr[0]
*/
////////////////////////////////////////////////////////////////////////.

let XATSDAPP = (dapp) => dapp
let XATSCAPP = (_, capp) => capp
let XATSCAST = (_, args) => args[0]

////////////////////////////////////////////////////////////////////////.
//
let XATSPCON =
  (pcon, argi) => pcon[argi+1]
//
let XATSPFLT = (pflt) => pflt
let XATSPROJ = (proj) => proj
let XATSP0RJ = (p0rj) => p0rj
let XATSP1RJ = (_, p1rj) => p1rj
let XATSP1CN = (_, p1cn) => p1cn
//
////////////////////////////////////////////////////////////////////////.
//
let XATSTRCD = (knd0) => knd0
//
let XATSTUP0 = (tpl0) => tpl0
let XATSTUP1 = (knd0, tpl1) => tpl1
let XATSRCD2 = (knd0, rcd2) => rcd2
//
////////////////////////////////////////////////////////////////////////.
//
let XATSROOT = (x) => [0, x]
let XATSLPFT = (i, x) => [1+0, x, i]
let XATSLPBX = (i, x) => [1+1, x, i]
let XATSLPCN = (i, x) => [1+2, x, i+1]
//
let XATSVAR0 = (    ) => XATSROOT([null])
let XATSVAR1 = (init) => XATSROOT([init])
//
let XATSADDR = (addr) => addr // HX: no-op
let XATSFLAT = (addr) => XATS000_lvget(addr)
//
////////////////////////////////////////////////////////////////////////.
//
let XATSCTAG = (_, t) => t
//
let XATS000_inteq = (x, y) => (x===y)
let XATS000_btfeq = (x, y) => (x===y)
let XATS000_chreq = (x, y) => (x===y)
//
let XATS000_streq = (x, y) => (x == y)
//
let XATS000_ctgeq = (v, t) => (v[0] == t)
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
function
XATS2JS_optn_nil()
{
  return XATSCAPP("optn_nil", [0])
}
function
XATS2JS_optn_cons(x0)
{
  return XATSCAPP("optn_cons", [1, x0])
}
////////////////////////////////////////////////////////////////////////.
function
XATS2JS_list_nil()
{
  return XATSCAPP("list_nil", [0])
}
function
XATS2JS_list_cons(x0, xs)
{
  return XATSCAPP("list_cons", [1, x0, xs])
}
////////////////////////////////////////////////////////////////////////.
function
XATS2JS_optn_vt_nil()
{
  return XATSCAPP("optn_vt_nil", [0])
}
function
XATS2JS_optn_vt_cons(x0)
{
  return XATSCAPP("optn_vt_cons", [1, x0])
}
////////////////////////////////////////////////////////////////////////.
function
XATS2JS_list_vt_nil()
{
  return XATSCAPP("list_vt_nil", [0])
}
function
XATS2JS_list_vt_cons(x0, xs)
{
  return XATSCAPP("list_vt_cons", [1, x0, xs])
}
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.

let XATS000_cfail = function()
  {
    throw new Error("XATS000_cfail");
  }

let XATS000_patck = function(pck)
  {
    if (!pck) {
      throw new Error("XATS000_patck");
    } // end-of-[if]
  }

////////////////////////////////////////////////////////////////////////.

let XATS000_fold = (pcon) => null
let XATS000_free = (pcon) => null

////////////////////////////////////////////////////////////////////////.
//
let XATS000_dp2tr =
  (p2tr) => XATS000_lvget(p2tr)
//
let XATS000_dl0az = (dlaz) => dlaz()
let XATS000_dl1az = (dlaz) => dlaz(1)
//
let XATS000_assgn =
  (lval, rval) => XATS000_lvset(lval, rval)
//
////////////////////////////////////////////////////////////////////////.
//
let XATS000_ftset =
  function(tpl0, idx1, rval)
  {
    let tpl1 = tpl0.slice();
    tpl1[idx1] = rval; return tpl1
  }
//
let XATS000_lvget = function(lval)
  {
    let ctag = lval[0]
    if (ctag === 0)
      return lval[1][0]
    if (ctag === 1+0)
      return XATS000_lvget(lval[1])[lval[2]]
    if (ctag === 1+1)
      return lval[1][lval[2]]
    if (ctag === 1+2)
      return lval[1][lval[2]]
  }
//
let XATS000_lvset = function(lval, rval)
  {
    let ctag = lval[0]
    if (ctag === 0) return ( lval[1][0] = rval )
    if (ctag === 1+0)
    {
      return XATS000_lvset
	(lval[1], XATS000_ftset(XATS000_lvget(lval[1]), lval[2], rval))
    }
    if (ctag === 1+1) return ( lval[1][lval[2]] = rval )
    if (ctag === 1+2) return ( lval[1][lval[2]] = rval )
  }
//
////////////////////////////////////////////////////////////////////////.
//
let XATS000_raise = (xcon) => { throw(xcon) }
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
the end of
[ATS3-XANADU/srcgen2/xats2js/srcgen1/xshared/runtime/xats2js_js1emit.js]
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// Mon Apr 28 12:13:50 AM EDT 2025
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
/*
the beg of
[ATS3-XANADU/srcgen2/xats2js/srcgen1/xshared/runtime/xats2js_prelude.js]
*/
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*/

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Thu 05 Sep 2024 11:21:07 AM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_console_log
  (x0)
{
  return console.log(x0) // HX: void
}
//
////////////////////////////////////////////////////////////////////////.
//
const
XATS2JS_the_print_store = [] // HX: for prints?
//
const
XATS2JS_the_prout_store = [] // HX: for general output
//
const
XATS2JS_the_prerr_store = [] // HX: for reporting errors
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_the_print_store_flush
  ( /*void*/ )
{
  let cs =
  XATS2JS_the_print_store.join("")
  XATS2JS_the_print_store.length = 0; return cs
}
//
function
XATS2JS_the_prout_store_flush
  ( /*void*/ )
{
  let cs =
  XATS2JS_the_prout_store.join("")
  XATS2JS_the_prout_store.length = 0; return cs
}
//
function
XATS2JS_the_prerr_store_flush
  ( /*void*/ )
{
  let cs =
  XATS2JS_the_prerr_store.join("")
  XATS2JS_the_prerr_store.length = 0; return cs
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_xtop000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*/

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Mon 09 Sep 2024 09:31:27 AM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_strn_sint$parse$fwork
  (rep0, work)
{
  let i0 = parseInt(rep0)
  if (!isNaN(i0)) { work(i0) }; return
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_strn_dflt$parse$fwork
  (rep0, work)
{
  let f0 = parseFloat(rep0)
  if (!isNaN(f0)) { work(f0) }; return
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_gbas000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*/

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Fri Sep 20 09:05:02 AM EDT 2024
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_bool_assert$errmsg
  (cond, emsg)
{
  if (!cond) {
    throw new Error("XATS2JS_bool_assert$errmsg: emsg = " + emsg)
  } ; return // HX: void is returned!
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_gdbg000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*/

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Sun 01 Sep 2024 04:27:52 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_sint_neg
  ( i1 )
{
  return ( -i1 ) // HX: neg
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_sint_lt$sint
  (i1, i2)
{
  return (i1 < i2) // HX: lt
}
function
XATS2JS_sint_gt$sint
  (i1, i2)
{
  return (i1 > i2) // HX: gt
}
//
function
XATS2JS_sint_lte$sint
  (i1, i2)
{
  return (i1 <= i2) // HX: lte
}
function
XATS2JS_sint_gte$sint
  (i1, i2)
{
  return (i1 >= i2) // HX: gte
}
//
function
XATS2JS_sint_eq$sint
  (i1, i2)
{
  return (i1 === i2) // HX: equal
}
function
XATS2JS_sint_neq$sint
  (i1, i2)
{
  return (i1 !== i2) // HX: noteq
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_sint_add$sint
  (i1, i2)
{
  return (i1 + i2) // HX: add
}
//
function
XATS2JS_sint_sub$sint
  (i1, i2)
{
  return (i1 - i2) // HX: sub
}
//
function
XATS2JS_sint_mul$sint
  (i1, i2)
{
  return (i1 * i2) // HX: mul
}
//
function
XATS2JS_sint_div$sint
  (i1, i2)
{
  return Math.trunc(i1 / i2)
}
//
function
XATS2JS_sint_mod$sint
  (i1, i2)
{
  return (i1 % i2) // HX: mod
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_sint_print
  ( i0 )
{
  let cs = i0.toString()
  XATS2JS_the_print_store.push(cs); return
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_gint000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*/

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Sun 01 Sep 2024 05:07:38 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_bool_lt
  (b1, b2)
{
  return (b1 < b2) // HX: lt
}
function
XATS2JS_bool_gt
  (b1, b2)
{
  return (b1 > b2) // HX: gt
}
//
function
XATS2JS_bool_lte
  (b1, b2)
{
  return (b1 <= b2) // HX: lte
}
function
XATS2JS_bool_gte
  (b1, b2)
{
  return (b1 >= b2) // HX: gte
}
//
function
XATS2JS_bool_eq
  (b1, b2)
{
  return (b1 === b2) // HX: equal
}
function
XATS2JS_bool_neq
  (b1, b2)
{
  return (b1 !== b2) // HX: noteq
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_bool000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*/

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Sun 01 Sep 2024 05:08:01 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_char_lt
  (c1, c2)
{
  return (c1 < c2) // HX: lt
}
function
XATS2JS_char_gt
  (c1, c2)
{
  return (c1 > c2) // HX: gt
}
//
function
XATS2JS_char_lte
  (c1, c2)
{
  return (c1 <= c2) // HX: lte
}
function
XATS2JS_char_gte
  (c1, c2)
{
  return (c1 >= c2) // HX: gte
}
//
function
XATS2JS_char_eq
  (c1, c2)
{
  return (c1 === c2) // HX: equal
}
function
XATS2JS_char_neq
  (c1, c2)
{
  return (c1 !== c2) // HX: noteq
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_char_add$sint
  (c1, i2)
{
  let c2 = c1+i2
  return (c2%256) // HX: char=int8
}
//
function
XATS2JS_char_sub$char
  (c1, c2)
{
  return (c1 - c2) // HX: char=int8
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_char_print
  ( c0 )
{
  let cs = String.fromCharCode(c0)
  XATS2JS_the_print_store.push(cs); return
}
//
////////////////////////////////////////////////////////////////////////.
//
/*
HX-2025-01-10: from gavinz
Sun Jan 19 01:11:19 AM EST 2025
*/
function
XATS2JS_char_make_sint( i0 ) { return i0 }
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_char000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*/

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Mon 09 Sep 2024 06:14:11 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_neg
  ( df )
{
  return ( -df ) //HX:neg
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_abs
  ( df )
{
  if (df >= 0.0)
    return df
  else
    return (-df) //HX:abs
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_sqrt
  ( df )
{
  return Math.sqrt(  df  )
}
//
function
XATS2JS_dflt_cbrt
  ( df )
{
  return Math.cbrt(  df  )
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_lt$dflt
  (f1, f2)
{
  return (f1 < f2) // HX: lt
}
function
XATS2JS_dflt_gt$dflt
  (f1, f2)
{
  return (f1 > f2) // HX: gt
}
//
function
XATS2JS_dflt_lte$dflt
  (f1, f2)
{
  return (f1 <= f2) // HX: lte
}
function
XATS2JS_dflt_gte$dflt
  (f1, f2)
{
  return (f1 >= f2) // HX: gte
}
//
function
XATS2JS_dflt_eq$dflt
  (f1, f2)
{
  return (f1 === f2) // HX: equal
}
function
XATS2JS_dflt_neq$dflt
  (f1, f2)
{
  return (f1 !== f2) // HX: noteq
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_add$dflt
  (f1, f2)
{
  return (f1 + f2) // HX: add
}
//
function
XATS2JS_dflt_sub$dflt
  (f1, f2)
{
  return (f1 - f2) // HX: sub
}
//
//
function
XATS2JS_dflt_mul$dflt
  (f1, f2)
{
  return (f1 * f2) // HX: mul
}
//
function
XATS2JS_dflt_div$dflt
  (f1, f2)
{
  return (f1 / f2) // HX: div
}
//
function
XATS2JS_dflt_mod$dflt
  (f1, f2)
{
  return (f1 % f2) // HX: mod
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_ceil
  ( df )
{
  return Math.ceil(df) // (1.2) = 2
}
function
XATS2JS_dflt_floor
  ( df )
{
  return Math.floor(df) // (1.2) = 1
}
function
XATS2JS_dflt_round
  ( df )
{
  // HX: (1.2) = 1 // (1.5) = 2
  return Math.round(df) // (-1.5) = 1
}
function
XATS2JS_dflt_trunc
  ( df )
{
  // HX: (1.2) = 1 // (1.9) = 1
  return Math.trunc(df) // (-1.2) = -1
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_dflt_print
  ( f0 )
{
  let cs = f0.toString()
  XATS2JS_the_print_store.push(cs); return
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_gflt000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*/

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Fri 16 Aug 2024 05:26:45 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_strn_cmp
  (x1, x2)
{
  var df
  var i0 = 0
  var n1 = x1.length;
  var n2 = x2.length;
  var n0 =
  (n1 <= n2) ? n1 : n2;
  while (i0 < n0) {
    df =
    x1.charCodeAt(i0)
    -
    x2.charCodeAt(i0)
    if (df !== 0) return df;
    i0 = (  i0 + 1  )
  }
  return (      n1 - n2      );
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_strn_length
  (cs)
{
  return cs.length // HX: field
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_strn_get$at$raw
  (cs, i0)
{
  return cs.charCodeAt(i0) // HX: ascii
}
function
XATS000_strn_get$at$raw
  (cs, i0)
{
  return XATS2JS_strn_get$at$raw(cs, i0)
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_strn_fmake_fwork
  (fwork)
{
  var cs = []
  fwork((ch) => {cs.push(ch);return})
  return String.fromCharCode.apply(null, cs)
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_strn_print
  ( cs )
{
  XATS2JS_the_print_store.push(cs); return
}
//
////////////////////////////////////////////////////////////////////////.
//
/*
HX-2025-04-26:
Sat Apr 26 08:48:02 PM EDT 2025
*/
//
function
XATS2JS_strn_fmake0_env$fwork
  (env, fwork)
{
  var cs = []
  fwork(env, (ch) => {cs.push(ch);return})
  return String.fromCharCode.apply(null, cs)
}
function
XATS2JS_strn_fmake1_env$fwork
  (env, fwork)
{
  var cs = []
  fwork(env, (ch) => {cs.push(ch);return})
  return String.fromCharCode.apply(null, cs)
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_strn000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*/

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Mon 12 Aug 2024 09:36:59 AM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_a0rf_lget
  ( A0 )
{
  return A0[0]
}
function
XATS2JS_a0rf_lset
  (A0, x1)
{
  A0[0] = x1; return
}
//
function
XATS2JS_a0rf_make_1val
  ( x0 )
{
  return [x0] // HX: singleton
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_a1rf_lget$at
  (A0, i0)
{
  return A0[i0]
}
function
XATS2JS_a1rf_lset$at
  (A0, i0, x1)
{
  A0[i0] = x1; return
}
//
function
XATS2JS_a1rf_make_ncpy
  (n0, x0)
{
  var i0 = 0
  var A0 = new Array(n0);
  while (i0 < n0) {
    A0[i0] = x0; i0 = i0 + 1
  }
  return A0 // HX: A0=[x0, x0, ..., x0]
}
//
function
XATS2JS_a1rf_make_nfun
  (n0, fopr)
{
  var i0 = 0
  var A0 = new Array(n0);
  while (i0 < n0) {
    A0[i0] = fopr(i0); i0 = i0 + 1
  }
  return A0 // HX: A0 = [fopr(0),...,fopr(n-1)]
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_axrf000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//                                                                    //.
//                         Applied Type System                        //.
//                                                                    //.
////////////////////////////////////////////////////////////////////////.

/*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*/

////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/*
Author: Hongwei Xi
Thu 15 Aug 2024 01:42:20 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*/
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_a1sz_length
  ( A0 )
{
  return A0.length
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_a1sz_lget$at
  (A0, i0)
{
  return A0[i0]
}
function
XATS2JS_a1sz_lset$at
  (A0, i0, x1)
{
  A0[i0] = x1; return
}
//
////////////////////////////////////////////////////////////////////////.
/*
HX-2024-09-06:
Fri 06 Sep 2024 04:18:38 PM EDT
*/
//
function
XATS2JS_a1sz_make_none
  ( n0 )
{
  var A0 = new Array(n0)
  return A0 // HX: A0 = [?, ..., ?]
}
////////////////////////////////////////////////////////////////////////.
//
/*
HX-2024-08-15:
Thu 15 Aug 2024 01:50:45 PM EDT
*/
//
function
XATS2JS_a1sz_make_ncpy
  (n0, x0)
{
  var i0 = 0
  var A0 = new Array(n0)
  while (i0 < n0) {
    A0[i0] = x0; i0 = i0 + 1
  }
  return A0 // HX: A0 = [x0, ..., x0]
}
//
function
XATS2JS_a1sz_make_nfun
  (n0, fopr)
{
  var i0 = 0
  var A0 = new Array(n0)
  while (i0 < n0) {
    A0[i0] = fopr(i0); i0 = i0 + 1
  }
  return A0 // HX: A0 = [fopr(0),...,fopr(n-1)]
}
//
////////////////////////////////////////////////////////////////////////.
//
function
XATS2JS_a1sz_fmake_fwork
  (fwork)
{
  var A0 = []
  fwork((x0) => {A0.push(x0);return}); return A0
}
//
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
// end of [ATS3/XANADU_prelude_DATS_CATS_JS_axsz000.cats]
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
const node = require('vscode-languageserver/node');
const text = require('vscode-languageserver-textdocument');

const connection = node.createConnection(node.ProposedFeatures.all);
const documents = new node.TextDocuments(text.TextDocument);

console.log = connection.console.log.bind(connection.console);
console.error = connection.console.error.bind(connection.console);

let hasConfigurationCapability = false;
let hasWorkspaceFolderCapability = false;
let hasDiagnosticRelatedInformationCapability = false;

/**
 * @param {node.InitializeParams} params 
 */
connection.onInitialize((params) => {
  const capabilities = params.capabilities;

  hasConfigurationCapability = !!(
    capabilities.workspace && !!capabilities.workspace.configuration
  );
  hasDiagnosticRelatedInformationCapability = !!(
    capabilities.textDocument &&
    capabilities.textDocument.publishDiagnostics &&
    capabilities.textDocument.publishDiagnostics.relatedInformation
  );

  const result = {
    capabilities: {
      textDocumentSyntax: node.TextDocumentSyncKind.Incremental,
			completionProvider: {
				resolveProvider: true
			},
      diagnosticProvider: {
				interFileDependencies: false,
				workspaceDiagnostics: false
      }
    }
  };
  if (hasWorkspaceFolderCapability) {
    result.capabilities.workspace = {
      workspaceFolders: {
        supported: true
      }
    }
  };
  return result;
});

connection.onInitialized(() => {
  console.log("ok");
  if (hasConfigurationCapability) {
    connection.client.register(node.DidChangeConfigurationNotification.type, undefined);
  }
  if (hasWorkspaceFolderCapability) {
    connection.workspace.onDidChangeWorkspaceFolders(_event => {
      connection.console.log("Workspace folder change event received.")
    });
  }
});

connection.languages.diagnostics.on(async (params) => {
  const document = documents.get(params.textDocument.uri);
  if (document !== undefined) {
    return {
      kind: node.DocumentDiagnosticReportKind.Full,
      items: await validateTextDocument(document)
    };
  } else {
    return {
      kind: node.DocumentDiagnosticReportKind.Full,
      items: []
    }
  }
});

/**
 * @param {text.TextDocument} change
 */
documents.onDidChangeContent(change => {
  validateTextDocument(change.document);
})

async function validateTextDocument(textDocument) {
  console.log(textDocument.uri);
  const diagnostic = {
    serverity: node.DiagnosticSeverity.Error,
    range: {
      start: textDocument.positionAt(0),
      end: textDocument.positionAt(1),
    },
    message: `something`,
    source: 'ex'
  };
  if (hasDiagnosticRelatedInformationCapability) {
    diagnostic.relatedInformation = [
      {
        location: {
          uri: textDocument.uri,
          range: Object.assign({}, diagnostic.range)
        },
        message: 'Spelling matters'
      },
      {
        location: {
          uri: textDocument.uri,
          range: Object.assign({}, diagnostic.range)
        },
        message: 'Particularly for names'
      }
    ];
  }
  const diagnostics = [];
  diagnostics.push(diagnostic);
  return diagnostics;
}

documents.listen(connection);
connection.listen();
// LCSRCsome1(src/DATS/main.dats)@(1(line=1,offs=1)--1(line=1,offs=1))
// I1Dnone1(I0Dnone1(LCSRCsome1(src/DATS/main.dats)@(1(line=1,offs=1)--1(line=1,offs=1));D3Cnone0()))
