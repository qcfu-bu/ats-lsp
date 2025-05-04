#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/diagnostic30.sats"

#staload "./../DATS/lsp_bootstrap.dats"

local

fun auxmain(out: diagnostics, d3p: d3pat): void =
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
    auxmain(out, d3p1); 
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

fun auxdexp(out: diagnostics, d3e: d3exp): void =
  case+ d3e.node() of
  | D3Eint _ => print(d3e)
  | D3Ebtf _ => print(d3e)
  | D3Echr _ => print(d3e)
  | D3Eflt _ => print(d3e)
  | D3Estr _ => print(d3e)
  | D3Ei00 _ => print(d3e)
  | D3Eb00 _ => print(d3e)
  | D3Ec00 _ => print(d3e)
  | D3Ef00 _ => print(d3e)
  | D3Es00 _ => print(d3e)
  | D3Etop _ => print(d3e)
  | D3Evar _ => print(d3e)
  | D3Econ _ => print(d3e)
  | D3Ecst _ => print(d3e)
  | D3Etimp _ => prints("D3Etimp(", "...", ")")
  | D3Esapp _ => prints("D3Esapp(", "...", ")")
  | D3Esapq _ => prints("D3Esapq(", "...", ")")
  | D3Etapp _ => prints("D3Etapp(", "...", ")")
  | D3Etapq _ => prints("D3Etapq(", "...", ")")
  | D3Edap0 _ => prints("D3Edap0(", "...", ")")
  | D3Edapp _ => prints("D3Edapp(", "...", ")")
  | D3Epcon _ => prints("D3Epcon(", "...", ")")
  | D3Eproj _ => prints("D3Eproj(", "...", ")")
  | D3Elet0 _ => prints("D3Elet0(", "...", ")")
  | D3Eift0 _ => prints("D3Eift0(", "...", ")")
  | D3Ecas0 _ => prints("D3Ecas0(", "...", ")")
  | D3Eseqn _ => prints("D3Eseqn(", "...", ")")
  | D3Etup0 _ => prints("D3Etup0(", "...", ")")
  | D3Etup1 _ => prints("D3Etup1(", "...", ")")
  | D3Ercd2 _ => prints("D3Ercd2(", "...", ")")
  | D3Elam0 _ => prints("D3Elam0(", "...", ")")
  | D3Efix0 _ => prints("D3Efix0(", "...", ")")
  | D3Etry0 _ => prints("D3Etry0(", "...", ")")
  | D3Eaddr _ => prints("D3Eaddr(", "...", ")")
  | D3Eview _ => prints("D3Eview(", "...", ")")
  | D3Eflat _ => prints("D3Eflat(", "...", ")")
  | D3Eeval _ => prints("D3Eeval(", "...", ")")
  | D3Efold _ => prints("D3Efold(", "...", ")")
  | D3Efree _ => prints("D3Efree(", "...", ")")
  | D3Ewhere _ => prints("D3Ewhere(", "...", ")")
  | D3Edp2tr _ => prints("D3Edp2tr(", "...", ")")
  | D3Edl0az _ => prints("D3Edl0az(", "...", ")")
  | D3Edl1az _ => prints("D3Edl1az(", "...", ")")
  | D3Eassgn _ => prints("D3Eassgn(", "...", ")")
  | D3Eraise _ => prints("D3Eraise(", "...", ")")
  | D3El0azy _ => prints("D3El0azy(", "...", ")")
  | D3El1azy _ => prints("D3El1azy(", "...", ")")
  | D3Eannot _ => prints("D3Eannot(", "...", ")")
  | D3Elabck (d3e1, lab2) => ( 
      print("D3Elabck("); 
      auxdexp(out, d3e1); 
      print(";"); 
      prints(lab2, ")"))
  | D3Et2pck(d3e1, t2p2) => let
      val t2p1 = d3e1.styp()
    in ( 
      print("D3Et2pck("); 
      auxdexp(out, d3e1); 
      print(";"); print(t2p1); 
      print(";"); 
      prints(t2p2, ")"))
    end
  | D3Enone0() => prints("D3Enone0(", ")")
  | D3Enone1(d2e1) => prints("D3Enone1(", d2e1, ")")
  | D3Enone2(d3e1) => prints("D3Enone2(", d3e1, ")")
  | D3Eerrck (lvl0, d3e1) => (
    print("D3Eerrck("); print(lvl0); print(";"); 
    auxdexp(out, d3e1); print(")"))
  | _ => let
      // TODO:
      val loc = d3e.lctn((*0*))
      val () = prerrsln("diagnostic30_d3exp:auxdexp: loc = ", loc)
      val () = prerrsln("diagnostic30_d3exp:auxdexp: d3e = ", d3e)
    end

fun auxmain( out: diagnostics, d3e: d3exp): void = 
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
    auxmain(out, d3e1); 
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