#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/diagnostic20.sats"
#staload "./../SATS/diagnostic30.sats"

local

fun diagnostic30_d3ecl_aux(out: diagnostics, dcl0: d3ecl): void =
  case+ dcl0.node() of
  | D3Cstatic(tknd, dcl1) => let 
      val () = diagnostic30_d3ecl(out, dcl1) 
    end
  | D3Cextern(tknd, dcl1) => let 
      val () = diagnostic30_d3ecl(out, dcl1) 
    end
  | D3Cdclst0(dcls) => let 
      val () = diagnostic30_d3eclist(out, dcls) 
    end
  | D3Clocal0(dcs1, dcs2) => let
      val () = diagnostic30_d3eclist(out, dcs1)
      val () = diagnostic30_d3eclist(out, dcs2)
    end
  | D3Cinclude(knd0, tknd, gsrc, fopt, dopt) => (
    case+ dopt of
    | optn_nil() => let
        val loc0 = dcl0.lctn()
        val lsrc = 
          case loc0.lsrc() of
          | LCSRCnone0() => "none"
          | LCSRCsome1(str) => str
          | LCSRCfpath(path) => path.fnm1()
        // FIXME:
        val () = stderr_capture_start()
        val () = prerrsln("D3Cinclude_error:\n", dcl0)
        val () = stderr_capture_stop()
        val msg = stderr_capture_get()
        //
        val d = diagnostic_make(
            severity_error$make(), 
            range_of_loctn(loc0), 
            msg, 
            lsrc
          )
      in out.push(d)
      end
    | optn_cons(dcls) => diagnostic30_d3eclist(out, dcls))
  | D3Cstaload(knd0, tknd, gsrc, fopt, dopt) => (
    case+ fopt of
    | optn_nil() => let
        val loc0 = dcl0.lctn()
        val lsrc = 
          case loc0.lsrc() of
          | LCSRCnone0() => "none"
          | LCSRCsome1(str) => str
          | LCSRCfpath(path) => path.fnm1()
        // FIXME:
        val () = stderr_capture_start()
        val () = prerrsln("D3Cstaload_error:\n", dcl0)
        val () = stderr_capture_stop()
        val msg = stderr_capture_get()
        //
        val d = diagnostic_make(
            severity_error$make(), 
            range_of_loctn(loc0), 
            msg, 
            lsrc
          )
      in out.push(d)
      end
    | optn_cons _ => ())
  | D3Cvaldclst(tknd, d3vs) => let
      val () = diagnostic30_d3valdclist(out, d3vs)
    end
  | D3Cvardclst(tknd, d3vs) => let
      val () = diagnostic30_d3vardclist(out, d3vs)
    end
  | D3Cfundclst(tknd, tqas, d2cs, d3fs) => let
      // TODO:
      // val () = diagnostic30_t3qaglst(out, tqas)
      // val () = diagnostic30_d3cstlst(out, d3cs)
      val () = diagnostic30_d3fundclist(out, d3fs)
    end
  | D3Cimplmnt0( 
      tknd, stmp, sqas, tqas, 
      dimp, tias, f3as, sres, 
      dexp
    ) => let
      // TODO:
      // val () = diagnostic30_s2qaglst(out, sqas)
      // val () = diagnostic30_t2qaglst(out, tqas)
      // val () = diagnostic30_t2iaglst(out, tias)
      //
      val () = diagnostic30_f3arglst(out, f3as)
      // val () = diagnostic30_s2res(out, sres)
      //
      val () = diagnostic30_d3exp(out, dexp)
    end
  | D3Cnone0 _ => ()
  | D3Cnone1(d2cl) => diagnostic20_d2ecl(out, d2cl)
  | D3Cnone2(d3cl) => diagnostic30_d3ecl(out, d3cl)
  | D3Cerrck(lvl1, dcl1) => diagnostic30_d3ecl(out, dcl0)
  | _ => let
      // TODO:
      val loc0 = dcl0.lctn()
      val () = prerrsln("diagnostic30_d3ecl: auxmain: loc0 = ", loc0)
      val () = prerrsln("diagnostic30_d3ecl: auxmain: dcl0 = ", dcl0)
    end

in

#implfun diagnostic30_d3ecl(out, dcl0) =
  case+ dcl0.node() of
  | D3Cerrck(lvl, d3cl) => (
    diagnostic30_d3ecl_aux(out, d3cl);
    if (lvl > DIAGNOSTIC30_ERRVL) then () 
    else let
      // TODO:
        val loc0 = dcl0.lctn() 
      in prerrsln("diagnostic30_d3ecl: ", loc0)
      end)
  | _ => ()

end

#implfun diagnostic30_d3eclist(out, dcls) =
  list_diagnostic30_fnp(out, dcls, diagnostic30_d3ecl)

#implfun diagnostic30_teqd3exp(out, tdxp) =
  case+ tdxp of
  | TEQD3EXPnone() => ()
  | TEQD3EXPsome(teq1, d3e2) => let
      val () = diagnostic30_d3exp(out, d3e2)
    end

#implfun diagnostic30_d3valdcl(out, dval) = let
    val () = diagnostic30_d3pat(out, dpat)
    val () = diagnostic30_teqd3exp(out, tdxp)
  end 
  where {
    val dpat = d3valdcl_get_dpat(dval)
    val tdxp = d3valdcl_get_tdxp(dval)
    // TODO:
    // val wsxp = d3valdcl_get_wsxp(dval)
  }

#implfun diagnostic30_d3vardcl(out, dvar) = let
    val () = diagnostic30_teqd3exp(out, dini)
  end 
  where {
  // TODO:
  // val dpid = d3vardcl_get_dpid(dvar)
  // val vpid = d3vardcl_get_vpid(dvar)
  // val sres = d3vardcl_get_sres(dvar)
    val dini = d3vardcl_get_dini(dvar)
  }

#implfun diagnostic30_d3fundcl(out, dfun) = let
    val () = diagnostic30_f3arglst(out, fags)
    val () = diagnostic30_teqd3exp(out, tdxp)
  end 
  where {
  // val dpid = d3fundcl_get_dpid(dfun)
    val fags = d3fundcl_get_farg(dfun)
  // val sres = d3fundcl_get_sres(dfun)
    val tdxp = d3fundcl_get_tdxp(dfun)
  // val wsxp = d3fundcl_get_wsxp(dfun)
  }

#implfun diagnostic30_d3valdclist(out, d3vs) =
  list_diagnostic30_fnp(out, d3vs, diagnostic30_d3valdcl)

#implfun diagnostic30_d3vardclist(out, d3vs) =
  list_diagnostic30_fnp(out, d3vs, diagnostic30_d3vardcl)

#implfun diagnostic30_d3fundclist(out, d3fs) =
  list_diagnostic30_fnp(out, d3fs, diagnostic30_d3fundcl)