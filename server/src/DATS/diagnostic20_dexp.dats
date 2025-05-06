#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/diagnostic20.sats"

local

fun diagnostic20_d2pat_aux(out: diagnostics, d2p: d2pat): void =
  case+ d2p.node() of
  | D2Pdapp(d2f0, npf1, d2ps) => let
      val () = diagnostic20_d2pat(out, d2f0)
      val () = diagnostic20_d2patlst(out, d2ps) 
    end
  | D2Ptup0(npf1, d2ps) => let
      val () = diagnostic20_d2patlst(out, d2ps) 
    end
  | D2Ptup1(tknd, npf1, d2ps) => let
      val () = diagnostic20_d2patlst(out, d2ps) 
    end
  | D2Prcd2(tknd, npf1, ldps) => let
      val () = diagnostic20_l2d2plst(out, ldps) 
    end
  | D2Pannot(d2p1, s1e2, s2e2) => let
      val () = diagnostic20_d2pat(out, d2p1)
    end
  | D2Pt2pck(d2p1, t2p2) => let
      val () = diagnostic20_d2pat(out, d2p1)
    end
  | D2Pnone0 _ => ()
  | D2Pnone1 _ => () 
  | D2Pnone2 _ => ()
  | D2Perrck(_, _) => diagnostic20_d2pat(out, d2p)
  | _ => let
      // TODO:
      val loc = d2p.lctn()
      val () = prerrsln("diagnostic20_d2pat:auxmain: loc = ", loc)
      val () = prerrsln("diagnostic20_d2pat:auxmain: d2p = ", d2p)
    end

in

#implfun diagnostic20_d2pat(out, d2p0) =
  case+ d2p0.node() of
  | D2Perrck(lvl, d2p1) => (
    diagnostic20_d2pat_aux(out, d2p1); 
    if (lvl > DIAGNOSTIC20_ERRVL) then () 
    else let
      val loc0 = d2p0.lctn()
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val () = prerrsln("diagnostic20_d2pat: ", d2p0)
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc0), 
          "diagnostic20_d2pat", lsrc
        )
    in diagnostics_push(out, d)
    end)
  | _ => ()


end

#implfun diagnostic20_l2d2p(out, ld2p) =
  case+ ld2p of
  | D2LAB(lab, d2p1) => diagnostic20_d2pat(out,d2p1)

local

fun diagnostic20_d2exp_aux(out: diagnostics, d2e: d2exp): void =
  case+ d2e.node() of
  | D2Esym0(drxp, d1e1, dpis) => let
      val () = diagnostic20_d2exp(out, drxp.dexp())
    end
  | D2Esapp(d2f0,s2es) => let
    // TODO:
      val () = diagnostic20_d2exp(out, d2f0)
    // val () = diagnostic20_s2explst(out, s2es)
    end
  | D2Etapp(d2f0,s2es) => let
    // TODO:
      val () = diagnostic20_d2exp(out, d2f0)
    // val () = diagnostic20_s2explst(out, s2es)
    end
  | D2Edapp(d2f0, npf1, d2es) => let
      val () = diagnostic20_d2exp(out, d2f0)
      val () = diagnostic20_d2explst(out, d2es)
    end
  | D2Eproj(tknd, drxp, dlab, dtup) => let
      val () = diagnostic20_d2exp(out, dtup)
    end
  | D2Elet0(dcls, d2e1) => let
      val () = diagnostic20_d2eclist(out, dcls)
      val () = diagnostic20_d2exp(out, d2e1)
    end
  | D2Ewhere(d2e1, dcls) => let
      val () = diagnostic20_d2eclist(out, dcls)
      val () = diagnostic20_d2exp(out, d2e1)
    end
  | D2Eift0(d2e1,dthn,dels) => let
      val () = diagnostic20_d2exp(out, d2e1)
      val () = diagnostic20_d2expopt(out, dthn)
      val () = diagnostic20_d2expopt(out, dels)
    end
  | D2Ecas0(tknd,d2e1,dcls) => let
      val () = diagnostic20_d2exp(out, d2e1)
      val () = diagnostic20_d2clslst(out, dcls)
    end
  | D2Eseqn(d2es, d2e1) => let
      val () = diagnostic20_d2explst(out, d2es)
      val () = diagnostic20_d2exp( out , d2e1 )
    end
  | D2Etup0(npf1, d2es) => let
      val () = diagnostic20_d2explst(out, d2es) 
    end
  | D2Etup1(tknd, npf1, d2es) => let
      val () = diagnostic20_d2explst(out, d2es) 
    end
  | D2Ercd2(tknd, npf1, ldes) => let
      val () = diagnostic20_l2d2elst(out, ldes) 
    end
  | D2Elam0(tknd, f2as, sres, arrw, dexp) => let
      val () = diagnostic20_f2arglst(out, f2as)
    // val () = diagnostic20_s2res(out, sres)
      val () = diagnostic20_d2exp(out, dexp)
    end
  | D2Efix0(tknd, dpid, f2as, sres, arrw, dexp) => let
      val () = diagnostic20_f2arglst(out, f2as)
    // val () = diagnostic20_s2res(out, sres)
      val () = diagnostic20_d2exp(out, dexp)
    end
  | D2Etry0(tknd,d2e1,dcls) => let
      val () = diagnostic20_d2exp(out, d2e1)
      val () = diagnostic20_d2clslst(out, dcls)
    end
  | D2Eaddr(d2e1) => let
      val () = diagnostic20_d2exp(out, d2e1)
    end
  | D2Eview(d2e1) => let
      val () = diagnostic20_d2exp(out, d2e1)
    end
  | D2Eeval(d2e1) => let
      val () = diagnostic20_d2exp(out, d2e1)
    end
  | D2Efree(d2e1) => let
      val () = diagnostic20_d2exp(out, d2e1)
    end
  | D2Eassgn(d2el, d2er) => let
      val () = diagnostic20_d2exp(out, d2el)
      val () = diagnostic20_d2exp(out, d2er)
    end
  | D2Ebrget(dpis, d2es) => let
      val () = diagnostic20_d2explst(out, d2es)
    end
  | D2Ebrset(dpis, d2es) => let
      val () = diagnostic20_d2explst(out, d2es)
    end
  | D2Eraise(tknd, d2e1) => let
      val () = diagnostic20_d2exp(out, d2e1)
    end
  | D2El0azy(dsym, d2e1) => let
      val () = diagnostic20_d2exp(out, d2e1)
    end
  | D2El1azy(dsym, d2e1, d2es) => let
      val () = diagnostic20_d2exp(out, d2e1)
      val () = diagnostic20_d2explst(out, d2es)
    end
  | D2Elabck(d2e1, lab2) => let
      val () = diagnostic20_d2exp(out, d2e1)
    end
  | D2Et2pck(d2e1, t2p2) => let
      val () = diagnostic20_d2exp(out, d2e1)
    end
  | D2Enone0 _ => ()
  | D2Enone1 _ => () 
  | D2Enone2 _ => ()
  | D2Eerrck(_, _) => diagnostic20_d2exp(out, d2e)
  | _ => let
      // TODO:
      val loc = d2e.lctn((*0*))
      val () = prerrsln("diagnostic20_d2exp:auxmain: loc = ", loc)
      val () = prerrsln("diagnostic20_d2exp:auxmain: d2e = ", d2e)
    end

in

#implfun diagnostic20_d2exp(out, d2e0) =
  case+ d2e0.node() of
  | D2Eerrck(lvl, d2e1) => (
    diagnostic20_d2exp_aux(out, d2e1); 
    if (lvl > DIAGNOSTIC20_ERRVL) then () 
    else let
      val loc0 = d2e0.lctn()
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val () = prerrsln("diagnostic20_d2exp: ", d2e0)
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc0), 
          "diagnostic20_d2exp", lsrc
        )
    in diagnostics_push(out, d)
    end)
  | _ => ()

end

#implfun diagnostic20_l2d2e(out, ld2e) =
  case+ ld2e of
  | D2LAB(lab,d2e1) => diagnostic20_d2exp(out,d2e1)

#implfun diagnostic20_f2arg(out, farg) =
  case+ farg.node() of
  | F2ARGdapp(npf1, d2ps) => diagnostic20_d2patlst(out, d2ps)
  | F2ARGsapp(s2vs, s2es) => ()
  | F2ARGmets(s2es) => ()

#implfun diagnostic20_d2gua(out, dgua) =
  case+ dgua.node() of
  | D2GUAexp(d2e1) => diagnostic20_d2exp(out, d2e1)
  | D2GUAmat(d2e1,d2p2) => let
      val () = diagnostic20_d2exp(out, d2e1)
      val () = diagnostic20_d2pat(out, d2p2)
    end

#implfun diagnostic20_d2gpt(out, dgpt) =
  case+ dgpt.node() of
  | D2GPTpat(d2p1) => diagnostic20_d2pat(out, d2p1)
  | D2GPTgua(d2p1,d2gs) => let
      val () = diagnostic20_d2pat(out, d2p1)
      val () = diagnostic20_d2gualst(out, d2gs)
    end

#implfun diagnostic20_d2cls(out, dcls) =
  case+ dcls.node() of
  | D2CLSgpt(dgpt) => diagnostic20_d2gpt(out, dgpt)
  | D2CLScls(dgpt,d2e2) => let
      val () = diagnostic20_d2gpt(out, dgpt)
      val () = diagnostic20_d2exp(out, d2e2)
    end

#implfun diagnostic20_d2patlst(out, d2ps) =
  list_diagnostic20_fnp(out, d2ps, diagnostic20_d2pat)

#implfun diagnostic20_d2patopt(out, dopt) =
  optn_diagnostic20_fnp(out, dopt, diagnostic20_d2pat)

#implfun diagnostic20_l2d2plst(out, ldps) =
  list_diagnostic20_fnp(out, ldps, diagnostic20_l2d2p)

#implfun diagnostic20_d2explst(out, d2es) =
  list_diagnostic20_fnp(out, d2es, diagnostic20_d2exp)

#implfun diagnostic20_d2expopt(out, dopt) =
  optn_diagnostic20_fnp(out, dopt, diagnostic20_d2exp)

#implfun diagnostic20_l2d2elst(out, ldes) =
  list_diagnostic20_fnp(out, ldes, diagnostic20_l2d2e)

#implfun diagnostic20_f2arglst(out, f2as) =
  list_diagnostic20_fnp(out, f2as, diagnostic20_f2arg)

#implfun diagnostic20_d2gualst(out, d2gs) =
  list_diagnostic20_fnp(out, d2gs, diagnostic20_d2gua)

#implfun diagnostic20_d2clslst(out, d2cs) =
  list_diagnostic20_fnp(out, d2cs, diagnostic20_d2cls)