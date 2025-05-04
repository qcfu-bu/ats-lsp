#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/diagnostic30.sats"

local

fun diagnostic30_d3pat_aux(out: diagnostics, d3p: d3pat): void =
  case+ d3p.node() of
  | D3Pdap1(d3f0) => let 
      val () = diagnostic30_d3pat(out, d3f0) 
    end
  | D3Pdapp(d3f0, npf1, d3ps) => let 
      val () = diagnostic30_d3pat(out, d3f0)
      val () = diagnostic30_d3patlst(out, d3ps) 
    end
  | D3Pnone0 _ => ()
  | D3Pnone1 _ => () 
  | D3Pnone2 _ => ()
  | D3Perrck(_, _) => diagnostic30_d3pat(out, d3p)
  | _ => let
      // TODO:
      val loc = d3p.lctn()
      val t2p = d3p.styp()
      val () = prerrsln("diagnostic30_d3pat: auxmain: loc = ", loc)
      val () = prerrsln("diagnostic30_d3pat: auxmain: t2p = ", t2p)
      val () = prerrsln("diagnostic30_d3pat: auxmain: d3p = ", d3p)
    end

in

#implfun diagnostic30_d3pat(out, d3p0) = 
  case+ d3p0.node() of
  | D3Perrck(lvl, d3p1) => (
    diagnostic30_d3pat_aux(out, d3p1); 
    if (lvl > DIAGNOSTIC30_ERRVL) then () 
    else let
      val loc0 = d3p0.lctn()
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc0), 
          "diagnostic30_d3pat", lsrc
        )
    in out.push(d)
    end)
  | _ => ()

end

#implfun diagnostic30_l3d3p(out, ld3p) =
  case+ ld3p of
  | D3LAB(lab,d3p1) => diagnostic30_d3pat(out,d3p1)

local

fun diagnostic30_d3exp_aux(out: diagnostics, d3e: d3exp): void = 
  case+ d3e.node() of
  | D3Esapp(d3f0,s2es) => let
      val () = diagnostic30_d3exp(out, d3f0)
    // val () = diagnostic30_s2explst(out, s2es)
    end
  | D3Etapp(d3f0,s2es) => let
      val () = diagnostic30_d3exp(out, d3f0)
    // val () = diagnostic30_s2explst(out, s2es)
    end
  | D3Edapp(d3f0, npf1, d3es) => let
      val () = diagnostic30_d3exp(out, d3f0)
      val () = diagnostic30_d3explst(out, d3es)
    end
  | D3Epcon(tknd ,lab1, d3e1) => let
      val () = diagnostic30_d3exp(out, d3e1)
    end
  | D3Eproj(tknd, lab1, d3e1) => let
      val () = diagnostic30_d3exp(out, d3e1)
    end
  | D3Elet0(dcls, d3e1) =>  let
      val () = diagnostic30_d3eclist(out, dcls)
      val () = diagnostic30_d3exp(out, d3e1)
    end
  | D3Eift0(d3e1, dthn, dels) => let
      val () = diagnostic30_d3exp(out, d3e1)
      val () = diagnostic30_d3expopt(out, dthn)
      val () = diagnostic30_d3expopt(out, dels)
    end
  | D3Ecas0(tknd, d3e1, dcls) => let
      val () = diagnostic30_d3exp(out, d3e1)
      val () = diagnostic30_d3clslst(out, dcls)
    end
  | D3Eseqn(d3es, d3e1) => let
      val () = diagnostic30_d3explst(out, d3es)
      val () = diagnostic30_d3exp(out, d3e1)
    end
  | D3Etry0(tknd, d3e1, dcls) => let
      val () = diagnostic30_d3exp(out, d3e1)
      val () = diagnostic30_d3clslst(out, dcls)
    end
  | D3Ewhere(d3e1, dcls) => let
      val () = diagnostic30_d3eclist(out, dcls)
      val () = diagnostic30_d3exp(out, d3e1)
    end
  | D3Eassgn(d3el, d3er) => let
      val () = diagnostic30_d3exp(out, d3el)
      val () = diagnostic30_d3exp(out, d3er)
    end
  | D3Elabck(d3e1, lab2) => let
      val () = diagnostic30_d3exp(out, d3e1)
      // val () = diagnostic30_label(out, lab2)
    end
  | D3Et2pck(d3e1, t2p2) => let
      val () = diagnostic30_d3exp(out, d3e1)
      // val () = diagnostic30_s2typ(out, t2p2)
    end
  | D3Enone0 _ => ()
  | D3Enone1 _ => () | D3Enone2 _ => ()
  | D3Eerrck(_, _) => diagnostic30_d3exp(out, d3e)
  | _ => let
      val loc = d3e.lctn()
      val t2p = d3e.styp()
      val () = prerrsln("diagnostic30_d3exp: auxmain: loc = ", loc)
      val () = prerrsln("diagnostic30_d3exp: auxmain: t2p = ", t2p)
      val () = prerrsln("diagnostic30_d3exp: auxmain: d3e = ", d3e)
    end

in

#implfun diagnostic30_d3exp(out, d3e0) = 
  case+ d3e0.node() of
  | D3Eerrck(lvl, d3e1) => (
    diagnostic30_d3exp_aux(out, d3e1); 
    if (lvl > DIAGNOSTIC30_ERRVL) then () 
    else let
      val loc0 = d3e0.lctn()
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val d = diagnostic_make(
        severity_error$make(), 
        range_of_loctn(loc0), 
        "diagnostic30_d3exp", lsrc
      )
    in out.push(d)
    end)
  | _ => ()

end

#implfun diagnostic30_l3d3e(out, ld3e) =
  case+ ld3e of
  | D3LAB(lab,d3e1) => diagnostic30_d3exp(out,d3e1)

#implfun diagnostic30_f3arg(out, farg) =
  case+ farg.node() of
  | F3ARGdapp(npf1, d3ps) => diagnostic30_d3patlst(out, d3ps)
  | F3ARGsapp(s2vs, s2es) => ()
  | F3ARGmets(s2es) => ()

#implfun diagnostic30_d3gua(out, dgua) =
  case+ dgua.node() of
  | D3GUAexp(d3e1) => diagnostic30_d3exp(out, d3e1)
  | D3GUAmat(d3e1,d3p2) => let
      val () = diagnostic30_d3exp(out, d3e1)
      val () = diagnostic30_d3pat(out, d3p2)
    end

#implfun diagnostic30_d3gpt(out, dgpt) =
  case+ dgpt.node() of
  | D3GPTpat(d3p1) => diagnostic30_d3pat(out, d3p1)
  | D3GPTgua(d3p1,d3gs) => let
      val () = diagnostic30_d3pat(out, d3p1)
      val () = diagnostic30_d3gualst(out, d3gs)
    end

#implfun diagnostic30_d3cls(out, dcls) = 
  case+ dcls.node() of
  | D3CLSgpt(dgpt) => diagnostic30_d3gpt(out, dgpt)
  | D3CLScls(dgpt,d3e2) => let
      val () = diagnostic30_d3gpt(out, dgpt)
      val () = diagnostic30_d3exp(out, d3e2)
    end

#implfun diagnostic30_d3patlst(out, d3ps) =
  list_diagnostic30_fnp(out, d3ps, diagnostic30_d3pat)

#implfun diagnostic30_l3d3plst(out, ldps) =
  list_diagnostic30_fnp(out, ldps, diagnostic30_l3d3p)

#implfun diagnostic30_d3explst(out, d3es) =
  list_diagnostic30_fnp(out, d3es, diagnostic30_d3exp)

#implfun diagnostic30_d3expopt(out, dopt) =
  optn_diagnostic30_fnp(out, dopt, diagnostic30_d3exp)

#implfun diagnostic30_l3d3elst(out, ldes) =
  list_diagnostic30_fnp(out, ldes, diagnostic30_l3d3e)

#implfun diagnostic30_f3arglst(out, f3as) =
  list_diagnostic30_fnp(out, f3as, diagnostic30_f3arg)

#implfun diagnostic30_d3gualst(out, d3gs) =
  list_diagnostic30_fnp(out, d3gs, diagnostic30_d3gua)

#implfun diagnostic30_d3clslst(out, d3cs) =
  list_diagnostic30_fnp(out, d3cs, diagnostic30_d3cls)