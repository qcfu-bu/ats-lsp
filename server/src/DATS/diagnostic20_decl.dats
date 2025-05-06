#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/diagnostic10.sats"
#staload "./../SATS/diagnostic20.sats"

// FIXME: file staexp2 does not symload s2cst_get_lctn correctly
#symload lctn with s2cst_get_lctn

fun diagnostic20_d2conlst(out: diagnostics, d2cs: d2conlst): void =
  case+ d2cs of
  | list_nil() => ()
  | list_cons(d2c1, d2cs) => 
    let
      val loc1 = d2c1.lctn()
      val t2p1 = d2c1.styp()
      val lsrc =
        case loc1.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc1), 
          "diagnostic20_d2conlst", lsrc
        )
      val () = out.push(d)
    in diagnostic20_d2conlst(out, d2cs)
    end

fun diagnostic20_s2cstlst(out: diagnostics, s2cs: s2cstlst): void =
  case+ s2cs of
  | list_nil() => ()
  | list_cons(s2c1, s2cs) => let
      val loc1 = s2c1.lctn()
      val s2t1 = s2c1.sort()
      val opt1 = s2c1.d2cs()
      val lsrc =
        case loc1.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc1), 
          "diagnostic20_d2conlst", lsrc
        )
      val () = out.push(d)
      val () =
        case+ opt1 of
        | ~optn_vt_nil() => ()
        | ~optn_vt_cons(d2cs) => 
          diagnostic20_d2conlst(out, d2cs)
    in diagnostic20_s2cstlst(out, s2cs)
    end

local

fun diagnostic20_d2ecl_aux(out: diagnostics, dcl0: d2ecl): void =
  case+ dcl0.node() of
  | D2Cthen0(dcls) => let
      val () = diagnostic20_d2eclist(out, dcls)
    end
  | D2Celse1(dcls) => let
      val () = diagnostic20_d2eclist(out, dcls)
    end
  | D2Cstatic(tknd, dcl1) => let
      val () = diagnostic20_d2ecl(out, dcl1)
    end
  | D2Cextern(tknd, dcl1) => let
      val () = diagnostic20_d2ecl(out, dcl1)
    end
  | D2Clocal0(dcs1, dcs2) => let
      val () = diagnostic20_d2eclist(out, dcs1)
      val () = diagnostic20_d2eclist(out, dcs2)
    end
  | D2Cabssort _ => ()
  | D2Cstacst0(s2c1, s2t2) => ()
  | D2Csortdef(sym1, s2tx) => ()
  | D2Csexpdef(s2c1, s2e2) => ()
  | D2Cinclude(knd0, tknd, gsrc, fopt, dopt) => let
      val () = diagnostic20_d2eclistopt(out, dopt)
    end
  | D2Cvaldclst(tknd, d2vs) => let
      val () = diagnostic20_d2valdclist(out, d2vs)
    end
  | D2Cvardclst(tknd, d2vs) => let
      val () = diagnostic20_d2vardclist(out, d2vs)
    end
  | D2Cfundclst(tknd, tqas, d2cs, d2fs) => let
    // val () = diagnostic20_t2qaglst(out, tqas)
    // val () = diagnostic20_d2cstlst(out, d2cs)
      val () = diagnostic20_d2fundclist(out, d2fs)
    end
  | D2Cimplmnt0(tknd, sqas, tqas, dimp, tias, f2as, sres, dexp) => let
      // val () = diagnostic20_s2qaglst(out, sqas)
      // val () = diagnostic20_t2qaglst(out, tqas)
      // val () = diagnostic20_t2iaglst(out, tias)
      val () = diagnostic20_f2arglst(out, f2as)
      // val () = diagnostic20_s2res(out, sres)
      val () = diagnostic20_d2exp(out, dexp)
    end
  | D2Cexcptcon(d1cl, d2cs) => let
      val () = diagnostic20_d2conlst(out, d2cs)
    end
  | D2Cdatatype(d1cl, s2cs) => let
      val () = diagnostic20_s2cstlst(out, s2cs)
    end
  | D2Cnone0 _ => ()
  | D2Cnone1(d1cl) => diagnostic10_d1ecl(out, d1cl)
  | D2Cnone2(d2cl) => diagnostic20_d2ecl(out, d2cl)
  | D2Cerrck(lvl1,dcl1) => diagnostic20_d2ecl(out, dcl0)
  | _ => let
      // TODO:
      val loc0 = dcl0.lctn()
      val () = prerrsln("diagnostic20_d2ecl: auxmain: loc0 = ", loc0)
      val () = prerrsln("diagnostic20_d2ecl: auxmain: dcl0 = ", dcl0)
    end

in

#implfun diagnostic20_d2ecl(out, dcl0: d2ecl): void =
  case+ dcl0.node() of
  | D2Cerrck(lvl, d2cl)  => (
    diagnostic20_d2ecl_aux(out, d2cl);
    if (lvl > DIAGNOSTIC20_ERRVL) then () 
    else let
      // TODO:
        val loc0 = dcl0.lctn() 
      in prerrsln("diagnostic20_d2ecl: ", loc0)
      end)
  | _ => ()

end

#implfun diagnostic20_d2eclist(out, dcls) =
  list_diagnostic20_fnp(out, dcls, diagnostic20_d2ecl)

#implfun diagnostic20_teqd2exp(out, tdxp) =
  case+ tdxp of
  | TEQD2EXPnone() => ()
  | TEQD2EXPsome(teq1, d2e2) => let
      val () = diagnostic20_d2exp(out, d2e2)
    end

#implfun diagnostic20_d2valdcl(out, dval) = let
    val () = diagnostic20_d2pat(out, dpat)
    val () = diagnostic20_teqd2exp(out, tdxp)
  end 
  where {
    val dpat = d2valdcl_get_dpat(dval)
    val tdxp = d2valdcl_get_tdxp(dval)
    // TODO:
    // val wsxp = d2valdcl_get_wsxp(dval)
  }

#implfun diagnostic20_d2vardcl(out, dvar) = let
    val () = diagnostic20_teqd2exp(out, dini)
  end 
  where {
  // TODO:
  // val dpid = d2vardcl_get_dpid(dvar)
  // val vpid = d2vardcl_get_vpid(dvar)
  // val sres = d2vardcl_get_sres(dvar)
    val dini = d2vardcl_get_dini(dvar)
  }

#implfun diagnostic20_d2fundcl(out, dfun) = let
    val () = diagnostic20_f2arglst(out, fags)
    val () = diagnostic20_teqd2exp(out, tdxp)
  end 
  where {
  // TODO:
  // val dpid = d2fundcl_get_dpid(dfun)
    val fags = d2fundcl_get_farg(dfun)
  // val sres = d2fundcl_get_sres(dfun)
    val tdxp = d2fundcl_get_tdxp(dfun)
  // val wsxp = d2fundcl_get_wsxp(dfun)
  }

#implfun diagnostic20_d2valdclist(out, d2vs) =
  list_diagnostic20_fnp(out, d2vs, diagnostic20_d2valdcl)

#implfun diagnostic20_d2vardclist(out, d2vs) =
  list_diagnostic20_fnp(out, d2vs, diagnostic20_d2vardcl)

#implfun diagnostic20_d2fundclist(out, d2fs) =
  list_diagnostic20_fnp(out, d2fs, diagnostic20_d2fundcl)