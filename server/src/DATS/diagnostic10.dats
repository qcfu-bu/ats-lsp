#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/diagnostic10.sats"

local

fun diagnostic10_g1exp_aux(out: diagnostics, g1e: g1exp): void =
  case+ g1e.node() of
  | G1Eid0 _ => ()
  | G1Eint _ => ()
  | G1Echr _ => ()
  | G1Eflt _ => ()
  | G1Estr _ => ()
  | G1Eb0sh _ => ()
  | G1Eb1sh(g1e1) => diagnostic10_g1exp(out, g1e1)
  | G1Ea0pp() => ()
  | G1Ea1pp(g1f0,g1e1) => let
      val () = diagnostic10_g1exp(out, g1f0)
      val () = diagnostic10_g1exp(out, g1e1)
    end
  | G1Ea2pp(g1f0,g1e1,g1e2) => let
      val () = diagnostic10_g1exp(out, g1f0)
      val () = diagnostic10_g1exp(out, g1e1)
      val () = diagnostic10_g1exp(out, g1e2)
    end
  | G1Elist(g1es) => diagnostic10_g1explst(out, g1es)
  | G1Eift0(g1e1,g1e2,g1e3) => let
      val () = diagnostic10_g1exp(out, g1e1)
      val () = diagnostic10_g1exp(out, g1e2)
      val () = diagnostic10_g1exp(out, g1e3)
    end
  | G1Enone0() => ()
  | G1Enone1(g0e1) => ()
  | G1Eerrck _ => diagnostic10_g1exp(out, g1e)

in

#implfun diagnostic10_g1exp(out, g1e0) =
  case+ g1e0.node() of
  | G1Eerrck(lvl,g1e1) => (
    diagnostic10_g1exp_aux(out, g1e1); 
    if (lvl > DIAGNOSTIC10_ERRVL) then () 
    else let
      val loc0 = g1e0.lctn() 
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val () = prerrsln("diagnostic10_g1exp: ", g1e0)
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc0), 
          "diagnostic10_g1exp", lsrc
        )
    in out.push(d)
    end)
  | _ => ()

end

local

fun diagnostic10_sort1_aux(out: diagnostics, s1t: sort1): void =
  case s1t.node() of
  | S1Tid0 _ => ()
  | S1Tint _ => ()
  | S1Ta0pp() => ()
  | S1Ta1pp(s1f0, s1t1) => let
      val () = diagnostic10_sort1(out, s1f0)
      val () = diagnostic10_sort1(out, s1t1)
    end
  | S1Ta2pp(s1f0, s1t1, s1t2) => let
      val () = diagnostic10_sort1(out, s1f0)
      val () = diagnostic10_sort1(out, s1t1)
      val () = diagnostic10_sort1(out, s1t2)
    end
  | S1Tlist(s1ts) => diagnostic10_sort1lst(out, s1ts)
  | S1Tqual0(tok1,s1t2) => diagnostic10_sort1(out, s1t2)
  | S1Tnone0() => ()
  | S1Tnone1(s0t1) => ()
  | S1Terrck _ => diagnostic10_sort1(out, s1t)

in

#implfun diagnostic10_sort1(out, s1t0) =
  case+ s1t0.node() of
  | S1Terrck(lvl, s1t1) => (
    diagnostic10_sort1_aux(out, s1t1); 
    if (lvl > DIAGNOSTIC10_ERRVL) then () 
    else let
      val loc0 = s1t0.lctn()
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val () = prerrsln("diagnostic10_sort1: ", s1t0)
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc0), 
          "diagnostic10_sort1", lsrc
        )
    in out.push(d)
    end)
  | _ => ()

end

local

fun diagnostic10_s1exp_aux(out: diagnostics, s1e: s1exp): void =
  case s1e.node() of
  | S1Eid0 _ => ()
  | S1Eint _ => ()
  | S1Eb0sh _ => ()
  | S1Eb1sh(s1e1) => diagnostic10_s1exp(out, s1e1)
  | S1Earrw(s1es) => diagnostic10_s1explst(out, s1es)
  | S1Ea0pp() => ()
  | S1Ea1pp(s1f0, s1e1) => let
      val () = diagnostic10_s1exp(out, s1f0)
      val () = diagnostic10_s1exp(out, s1e1)
    end
  | S1Ea2pp(s1f0, s1e1, s1e2) => let
      val () = diagnostic10_s1exp(out, s1f0)
      val () = diagnostic10_s1exp(out, s1e1)
      val () = diagnostic10_s1exp(out, s1e2)
    end
  | S1El1st(s1es) => diagnostic10_s1explst(out, s1es)
  | S1El2st(ses1, ses2) => let
      val () = diagnostic10_s1explst(out, ses1)
      val () = diagnostic10_s1explst(out, ses2)
    end
  | S1Et1up(tknd, s1es) => diagnostic10_s1explst(out, s1es)
  | S1Et2up(tknd, ses1, ses2) => let
      val () = diagnostic10_s1explst(out, ses1)
      val () = diagnostic10_s1explst(out, ses2)
    end
  | S1Er1cd(tknd, lses) => diagnostic10_l1s1elst(out, lses)
  | S1Er2cd(tknd, lss1, lss2) => let
      val () = diagnostic10_l1s1elst(out, lss1)
      val () = diagnostic10_l1s1elst(out, lss2)
    end
  | S1Euni0(s1qs) => diagnostic10_s1qualst(out, s1qs)
  | S1Eexi0(tknd, s1qs) => diagnostic10_s1qualst(out, s1qs)
  | S1Elams(smas, tres, s1e1) => let
      val () = diagnostic10_s1maglst(out, smas)
      val () = diagnostic10_sort1opt(out, tres)
      val () = diagnostic10_s1exp(out, s1e1)
    end
  | S1Eannot(s1e1, s1t2) => let
      val () = diagnostic10_s1exp(out, s1e1)
      val () = diagnostic10_sort1(out, s1t2)
    end
  | S1Equal0(tok1, s1e2) => let
      val () = diagnostic10_s1exp(out, s1e2)
    end
  | S1Enone0() => ()
  | S1Enone1(s0e1) => ()
  | S1Eerrck _ => diagnostic10_s1exp(out, s1e)
  | _ => diagnostic10_s1exp(out, s1e)

in

#implfun diagnostic10_s1exp(out, s1e0) =
  case+ s1e0.node() of
  | S1Eerrck(lvl, s1e1) => (
    diagnostic10_s1exp_aux(out, s1e1); 
    if (lvl > DIAGNOSTIC10_ERRVL) then () 
    else let
      val loc0 = s1e0.lctn()
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val () = prerrsln("diagnostic10_s1exp: ", s1e0)
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc0), 
          "diagnostic10_s1exp", lsrc
        )
    in out.push(d)
    end)
  | _ => ()

end

#implfun diagnostic10_l1s1e(out, lse0) =
  case+ lse0 of
  | S1LAB(lab, s1e1) => diagnostic10_s1exp(out, s1e1)

#implfun diagnostic10_s1arg(out, s1a0) =
  case+ s1a0.node() of
  | S1ARGsome(sid0,topt) => diagnostic10_sort1opt(out, topt)

#implfun diagnostic10_s1mag(out, s1ma) =
  case+ s1ma.node() of
  | S1MAGlist(s1as) => diagnostic10_s1arglst(out, s1as)

#implfun diagnostic10_t1arg(out, t1a0) =
  case+ t1a0.node() of
  | T1ARGsome(s1t1, topt) => diagnostic10_sort1(out, s1t1)

#implfun diagnostic10_t1mag(out, t1ma) =
  case+ t1ma.node() of
  | T1MAGlist(t1as) => diagnostic10_t1arglst(out, t1as)

#implfun diagnostic10_s1tdf(out, tdf0) =
  case+ tdf0.node() of
  | S1TDFsort(s1t1) => diagnostic10_sort1(out, s1t1)
  | S1TDFtsub(s1a1,s1es) => let
      val () = diagnostic10_s1arg(out, s1a1)
      val () = diagnostic10_s1explst(out, s1es)
    end

local

fun diagnostic10_d1pat_aux(out: diagnostics, d1p: d1pat): void =
  case d1p.node() of
  | D1Pid0 _ => ()
  | D1Pint _ => ()
  | D1Pb0sh _ => ()
  | D1Pb1sh(d1p1) => diagnostic10_d1pat(out, d1p1)
  | D1Pa0pp() => ()
  | D1Pa1pp(d1f0, d1p1) => let
      val () = diagnostic10_d1pat(out, d1f0)
      val () = diagnostic10_d1pat(out, d1p1)
    end
  | D1Pa2pp(d1f0, d1p1, d1p2) => let
      val () = diagnostic10_d1pat(out, d1f0)
      val () = diagnostic10_d1pat(out, d1p1)
      val () = diagnostic10_d1pat(out, d1p2)
    end
  | D1Pl1st(d1ps) => diagnostic10_d1patlst(out, d1ps)
  | D1Pl2st(dps1,dps2) => let
      val () = diagnostic10_d1patlst(out, dps1)
      val () = diagnostic10_d1patlst(out, dps2)
    end
  | D1Pt1up(tknd, d1ps) => diagnostic10_d1patlst(out, d1ps)
  | D1Pt2up(tknd, dps1, dps2) => let
      val () = diagnostic10_d1patlst(out, dps1)
      val () = diagnostic10_d1patlst(out, dps2)
    end
  | D1Pannot(d1p1,s1e2) => let
      val () = diagnostic10_d1pat(out, d1p1)
      val () = diagnostic10_s1exp(out, s1e2)
    end
  | D1Pqual0(tok1,d1p2) => diagnostic10_d1pat(out, d1p2)
  | D1Pnone0() => ()
  | D1Pnone1(s0e1) => ()
  | D1Perrck _ => diagnostic10_d1pat(out, d1p)

in

#implfun diagnostic10_d1pat(out, d1p0) =
  case+ d1p0.node() of
  | D1Perrck(lvl, d1p1) => (
    diagnostic10_d1pat_aux(out, d1p1); 
    if (lvl > DIAGNOSTIC10_ERRVL) then () 
    else let
      val loc0 = d1p0.lctn()
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val () = prerrsln("diagnostic10_d1pat: ", d1p0)
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc0), 
          "diagnostic10_d1pat", lsrc
        )
    in out.push(d)
    end)
  | _ => ()

end

#implfun diagnostic10_l1d1p(out, lde0) =
  case+ lde0 of
  | D1LAB(lab,d1p1) => diagnostic10_d1pat(out, d1p1)

local

fun diagnostic10_d1exp_aux(out: diagnostics, d1e: d1exp): void =
  case d1e.node() of
  | D1Eid0 _ => ()
  | D1Eint _ => ()
  | D1Eb0sh _ => ()
  | D1Eb1sh(d1e1) => diagnostic10_d1exp(out, d1e1)
  | D1Ea0pp() => ()
  | D1Ea1pp(d1f0, d1e1) => let
      val () = diagnostic10_d1exp(out, d1f0)
      val () = diagnostic10_d1exp(out, d1e1)
    end
  | D1Ea2pp(d1f0, d1e1, d1e2) => let
      val () = diagnostic10_d1exp(out, d1f0)
      val () = diagnostic10_d1exp(out, d1e1)
      val () = diagnostic10_d1exp(out, d1e2)
    end
  | D1Esarg(s1es) => diagnostic10_s1explst(out, s1es)
  | D1Etarg(s1es) => diagnostic10_s1explst(out, s1es)
  | D1El1st(d1es) => diagnostic10_d1explst(out, d1es)
  | D1El2st(des1,des2) => let
      val () = diagnostic10_d1explst(out, des1)
      val () = diagnostic10_d1explst(out, des2)
    end
  | D1Es1eq(d1es) => diagnostic10_d1explst(out, d1es)
  | D1Es2eq(des1,des2) => let
      val () = diagnostic10_d1explst(out, des1)
      val () = diagnostic10_d1explst(out, des2)
    end
  | D1Eift0(d1e1, dthn, dels) => let
      val () = diagnostic10_d1exp(out, d1e1)
      val () = diagnostic10_d1expopt(out, dthn)
      val () = diagnostic10_d1expopt(out, dels)
    end
  | D1Ecas0(tknd, d1e1, d1cs) => let
      val () = diagnostic10_d1exp(out, d1e1)
      val () = diagnostic10_d1clslst(out, d1cs)
    end
  | D1Elet0(d1cs, d1e1) => let
      val () = diagnostic10_d1eclist(out, d1cs)
      val () = diagnostic10_d1exp(out, d1e1)
    end
  | D1Ewhere(d1e1, d1cs) => let
      val () = diagnostic10_d1eclist(out, d1cs) 
      val () = diagnostic10_d1exp(out, d1e1)
    end
  | D1Ebrckt(d1es) => diagnostic10_d1explst(out, d1es)
  | D1Edtsel(tknd, lab1, dopt) => diagnostic10_d1expopt(out, dopt)
  | D1Et1up(tknd,d1es) => diagnostic10_d1explst(out, d1es)
  | D1Et2up(tknd, des1, des2) => let
      val () = diagnostic10_d1explst(out, des1)
      val () = diagnostic10_d1explst(out, des2)
    end
  | D1Elam0(tknd, f1as, sres, arrw, d1e1) => let
      val () = diagnostic10_f1arglst(out, f1as)
      val () = diagnostic10_s1res(out, sres)
      val () = diagnostic10_d1exp(out, d1e1)
    end
  | D1Efix0(tknd, dpid, f1as, sres, arrw, d1e1) => let
      val () = diagnostic10_f1arglst(out, f1as)
      val () = diagnostic10_s1res(out, sres)
      val () = diagnostic10_d1exp(out, d1e1)
    end
  | D1Etry0(tknd, d1e1, d1cs) => let
      val () = diagnostic10_d1exp(out, d1e1)
      val () = diagnostic10_d1clslst(out, d1cs)
    end
  | D1Eraise(tknd, d1e1) => let
      val () = diagnostic10_d1exp(out, d1e1)
    end
  | D1Eannot(d1e1, s1e2) => let
      val () = diagnostic10_d1exp(out, d1e1)
      val () = diagnostic10_s1exp(out, s1e2)
    end
  | D1Equal0(tok1, d1e2) => diagnostic10_d1exp(out, d1e2)
  | D1Eextnam(tknd, gnam) => ()
  | D1Eexists(tknd, d1es, d1e1) => let
      val () = diagnostic10_d1explst(out, d1es)
      val () = diagnostic10_d1exp(out , d1e1)
    end
  | D1Enone0() => ()
  | D1Enone1(d0e1) => ()
  | D1Eerrck _ => diagnostic10_d1exp(out, d1e)

in

#implfun diagnostic10_d1exp(out, d1e0) =
  case+ d1e0.node() of
  | D1Eerrck(lvl, d1e1) => (
    diagnostic10_d1exp_aux(out, d1e1); 
    if (lvl > DIAGNOSTIC10_ERRVL) then () 
    else let
      val loc0 = d1e0.lctn()
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val () = prerrsln("diagnostic10_d1exp: ", d1e0)
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc0), 
          "diagnostic10_d1exp", lsrc
        )
    in out.push(d)
    end)
  | _ => ()

end

#implfun diagnostic10_l1d1e(out, lde0) =
  case+ lde0 of
  | D1LAB(lab,d1e1) => diagnostic10_d1exp(out,d1e1)

#implfun diagnostic10_f1arg(out, farg) =
  case+ farg.node() of
  | F1ARGdapp(dpat) => diagnostic10_d1pat(out, dpat)
  | F1ARGsapp(s1qs) => diagnostic10_s1qualst(out, s1qs)
  | F1ARGmets(s1es) => diagnostic10_s1explst(out, s1es)

#implfun diagnostic10_s1res(out, sres) =
  case+ sres of
  | S1RESnone() => ()
  | S1RESsome(seff, s1e1) => diagnostic10_s1exp(out, s1e1)

#implfun diagnostic10_d1gua(out, dgua) =
  case+ dgua.node() of
  | D1GUAexp(d1e1) => diagnostic10_d1exp(out, d1e1)
  | D1GUAmat(d1e1,d1p2) => let
      val () = diagnostic10_d1exp(out, d1e1)
      val () = diagnostic10_d1pat(out, d1p2)
    end

#implfun diagnostic10_d1gpt(out, dgpt) =
  case+ dgpt.node() of
  | D1GPTpat(d1p1) => diagnostic10_d1pat(out, d1p1)
  | D1GPTgua(d1p1,d1gs) => let
      val () = diagnostic10_d1pat(out, d1p1)
      val () = diagnostic10_d1gualst(out, d1gs)
    end

#implfun diagnostic10_d1cls(out, dcls) =
  case+ dcls.node() of
  | D1CLSgpt(dgpt) => diagnostic10_d1gpt(out, dgpt)
  | D1CLScls(dgpt,d1e2) => let
      val () = diagnostic10_d1gpt(out, dgpt)
      val () = diagnostic10_d1exp(out, d1e2)
    end

local

fun diagnostic10_d1eclopt(out: diagnostics, dopt: d1eclopt): void =
  case+ dopt of
  | optn_nil() => ()
  | optn_cons(d1cl) => diagnostic10_d1ecl(out, d1cl)

fun diagnostic10_d1ecl_aux(out: diagnostics , dcl: d1ecl): void =
  case+ dcl.node() of
  | D1Cd0ecl _ => ()
  | D1Cstatic(tknd, dcl1) => diagnostic10_d1ecl(out, dcl1)
  | D1Cextern(tknd, dcl1) => diagnostic10_d1ecl(out, dcl1)
  | D1Clocal0(dcs1, dcs2) => let
      val () = diagnostic10_d1eclist(out, dcs1)
      val () = diagnostic10_d1eclist(out, dcs2)
    end
  | D1Cabssort _ => ()
  | D1Cstacst0(tknd, sid0, tmas, s1t1) => let
      val () = diagnostic10_t1maglst(out, tmas)
      val () = diagnostic10_sort1(out, s1t1)
    end
  | D1Csortdef(tknd, tid0, tdf1) => diagnostic10_s1tdf(out, tdf1)
  | D1Csexpdef(tknd, seid, smas, tres, s1e1) => let
      val () = diagnostic10_s1maglst(out, smas)
      val () = diagnostic10_sort1opt(out, tres)
      val () = diagnostic10_s1exp(out, s1e1)
    end
  | D1Cabstype(tknd, seid, tmas, tres, atdf) => let
      val () = diagnostic10_t1maglst(out, tmas)
      val () = diagnostic10_sort1opt(out, tres)
      val () = diagnostic10_a1tdf(out, atdf)
    end
  | D1Cabsimpl(tknd, sqid, smas, tres, s1e1) => let
      val () = diagnostic10_s1maglst(out, smas)
      val () = diagnostic10_sort1opt(out, tres)
      val () = diagnostic10_s1exp(out, s1e1)
    end
  | D1Csymload(tknd, symb, dqid, gopt) => 
    diagnostic10_g1expopt(out, gopt)
  | D1Cinclude(knd0, tknd, g1e1, fopt, dopt) => (
    case+ dopt of
    | optn_nil() => let
        val loc0 = dcl.lctn()
        val lsrc = 
          case loc0.lsrc() of
          | LCSRCnone0() => "none"
          | LCSRCsome1(str) => str
          | LCSRCfpath(path) => path.fnm1()
        val () = prerrsln("diagnostic10_d1ecl_D1Cinclude: ", dcl)
        val d = diagnostic_make(
            severity_error$make(), 
            range_of_loctn(loc0), 
            "diagnostic10_d1ecl_D1Cinclude", lsrc
          )
      in out.push(d)
      end
    | optn_cons(dcls) => diagnostic10_d1eclist(out, dcls))
  | D1Cstaload(knd0, tknd, g1e1, fopt, dopt) => (
    case+ dopt of
    | optn_nil() => let
        val loc0 = dcl.lctn()
        val lsrc = 
          case loc0.lsrc() of
          | LCSRCnone0() => "none"
          | LCSRCsome1(str) => str
          | LCSRCfpath(path) => path.fnm1()
        val () = prerrsln("diagnostic10_d1ecl_D1Cstaload: ", dcl)
        val d = diagnostic_make(
            severity_error$make(), 
            range_of_loctn(loc0), 
            "diagnostic10_d1ecl_D1Cstaload", lsrc
          )
      in out.push(d)
      end
    | optn_cons@(shrd, dpar) =>
      let val () = if (shrd > 0) then
        diagnostic10_d1parsed(out, dpar)
      end)
  | D1Cdyninit(tknd, g1e1) => diagnostic10_g1exp(out, g1e1)
  | D1Cdatasort(tknd, d1ts) => diagnostic10_d1tstlst(out, d1ts)
  | D1Cvaldclst(tknd, d1cs) => diagnostic10_d1valdclist(out, d1cs)
  | D1Cvardclst(tknd, d1cs) => diagnostic10_d1vardclist(out, d1cs)
  | D1Cfundclst(tknd, tqas, d1cs) => let
      val () = diagnostic10_t1qaglst(out, tqas)
      val () = diagnostic10_d1fundclist(out, d1cs)
    end
  | D1Cimplmnt0(tknd, sqas, tqas, dqid, tias, f1as, sres, d1e1) => let
      val () = diagnostic10_s1qaglst(out, sqas)
      val () = diagnostic10_t1qaglst(out, tqas)
      val () = diagnostic10_t1iaglst(out, tias)
      val () = diagnostic10_f1arglst(out, f1as)
      val () = diagnostic10_s1res(out, sres)
      val () = diagnostic10_d1exp(out, d1e1)
    end
  | D1Cdynconst(tknd, tqas, d1cs) => let
      val () = diagnostic10_t1qaglst(out, tqas)
      val () = diagnostic10_d1cstdclist(out, d1cs)
    end
  | D1Cnone0() => ()
  | D1Cnone1(d0cl) => 
    // TODO:
    // diagnostic10_d0ecl(out, d0cl)
    ()
  | D1Cthen0(dcls) => diagnostic10_d1eclist(out, dcls)
  | D1Celse1(dcls) => diagnostic10_d1eclist(out, dcls)
  | D1Cifexp(tknd, dthn, dels, dend) => let
      val () = diagnostic10_d1eclopt(out, dthn)
      val () = diagnostic10_d1eclopt(out, dels)
    end
  | D1Celsif(tknd, dthn, dels, dend) => let
      val () = diagnostic10_d1eclopt(out, dthn)
      val () = diagnostic10_d1eclopt(out, dels)
    end
  | D1Cerrck(lvl1, dcl1) => diagnostic10_d1ecl(out, dcl)

in

#implfun diagnostic10_d1ecl(out, dcl0) =
  case+ dcl0.node() of
  | D1Cerrck(lvl, d1cl)  => (
    diagnostic10_d1ecl_aux(out, d1cl);
    if (lvl > DIAGNOSTIC10_ERRVL) then () 
    else let 
      val loc0 = dcl0.lctn() 
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val () = prerrsln("diagnostic10_d1ecl: ", dcl0)
      val d = diagnostic_make(
          severity_error$make(), 
          range_of_loctn(loc0), 
          "diagnostic10_d1ecl", lsrc
        )
    in out.push(d)
    end)
  | _ => ()

end

#implfun diagnostic10_q1arg(out, q1a0) =
  case+ q1a0.node() of
  | Q1ARGsome(tok1,tres) => diagnostic10_sort1opt(out, tres)

#implfun diagnostic10_s1qag(out, s1q0) =
  case+ s1q0.node() of
  | S1QAGsome(q1as) => diagnostic10_q1arglst(out, q1as)

#implfun diagnostic10_t1qag(out, t1q0) =
  case+ t1q0.node() of
  | T1QAGsome(q1as) => diagnostic10_q1arglst(out, q1as)

#implfun diagnostic10_t1iag(out, t1i0) =
  case+ t1i0.node() of
  | T1IAGsome(s1es) => diagnostic10_s1explst(out, s1es)

#implfun diagnostic10_a1tdf(out, atdf) =
  case+ atdf of
  | A1TDFsome() => ()
  | A1TDFlteq(s1e1) => diagnostic10_s1exp(out, s1e1)
  | A1TDFeqeq(s1e1) => diagnostic10_s1exp(out, s1e1)

#implfun diagnostic10_g1explst(out, g1es) =
  list_foritm<g1exp>(g1es) 
  where {
    #impltmp
    foritm$work<g1exp>(g1e1) = diagnostic10_g1exp(out,g1e1)
  }

#implfun diagnostic10_g1expopt(out, gopt) =
  optn_foritm<g1exp>(gopt) 
  where {
    #impltmp
    foritm$work<g1exp>(g1e1) = diagnostic10_g1exp(out, g1e1)
  }

#implfun diagnostic10_sort1lst(out, s1ts) =
  list_foritm<sort1>(s1ts) 
  where {
    #impltmp
    foritm$work<sort1>(s1t1) = diagnostic10_sort1(out, s1t1)
  }

#implfun diagnostic10_sort1opt(out, topt) =
  optn_foritm<sort1>(topt) 
  where {
    #impltmp
    foritm$work<sort1>(s1t1) = diagnostic10_sort1(out, s1t1)
  }

#implfun diagnostic10_s1explst(out, s1es) =
  list_foritm<s1exp>(s1es) 
  where {
    #impltmp
    foritm$work<s1exp>(s1e1) = diagnostic10_s1exp(out, s1e1)
  }

#implfun diagnostic10_s1expopt(out, sopt) =
  optn_foritm<s1exp>(sopt) 
  where {
    #impltmp
    foritm$work<s1exp>(s1e1) = diagnostic10_s1exp(out, s1e1)
  }

#implfun diagnostic10_l1s1elst(out, lses) =
  list_foritm<l1s1e>(lses) 
  where {
    #impltmp
    foritm$work<l1s1e>(lse1) = diagnostic10_l1s1e(out, lse1)
  }

#implfun diagnostic10_s1arglst(out, s1as) =
  list_foritm<s1arg>(s1as) 
  where {
    #impltmp
    foritm$work<s1arg>(s1a1) = diagnostic10_s1arg(out, s1a1)
  }

#implfun diagnostic10_s1maglst(out, smas) =
  list_foritm<s1mag>(smas) 
  where {
    #impltmp
    foritm$work<s1mag>(sma1) = diagnostic10_s1mag(out, sma1)
  }

#implfun diagnostic10_t1arglst(out, t1as) =
  list_foritm<t1arg>(t1as) 
  where {
    #impltmp
    foritm$work<t1arg>(t1a1) = diagnostic10_t1arg(out, t1a1)
  }

#implfun diagnostic10_t1maglst(out, tmas) =
  list_foritm<t1mag>(tmas) 
  where {
    #impltmp
    foritm$work<t1mag>(tma1) = diagnostic10_t1mag(out,tma1)
  }

#implfun diagnostic10_s1tcnlst(out, tcns) =
  list_foritm<s1tcn>(tcns) 
  where {
    #impltmp
    foritm$work<s1tcn>(tcn1) = diagnostic10_s1tcn(out,tcn1)
  }

#implfun diagnostic10_d1tstlst(out, d1ts) =
  list_foritm<d1tst>(d1ts) 
  where {
    #impltmp
    foritm$work<d1tst>(d1t1) = diagnostic10_d1tst(out,d1t1)
  }

#implfun diagnostic10_d1patlst(out, d1ps) =
  list_foritm<d1pat>(d1ps) 
  where {
    #impltmp
    foritm$work<d1pat>(d1p1) = diagnostic10_d1pat(out, d1p1)
  }

#implfun diagnostic10_l1d1plst(out, ldps) =
  list_foritm<l1d1p>(ldps) 
  where {
    #impltmp
    foritm$work<l1d1p>(ldp1) = diagnostic10_l1d1p(out,ldp1)
  }

#implfun diagnostic10_d1explst(out, d1es) =
  list_foritm<d1exp>(d1es) 
  where {
    #impltmp
    foritm$work<d1exp>(d1e1) = diagnostic10_d1exp(out, d1e1)
  }

#implfun diagnostic10_d1expopt(out, dopt) =
  optn_foritm<d1exp>(dopt) 
  where {
    #impltmp
    foritm$work<d1exp>(d1e1) = diagnostic10_d1exp(out, d1e1)
  }

#implfun diagnostic10_l1d1elst(out, ldes) =
  list_foritm<l1d1e>(ldes) 
  where {
    #impltmp
    foritm$work<l1d1e>(lde1) = diagnostic10_l1d1e(out, lde1)
  }

#implfun diagnostic10_f1arglst(out, f1as) =
  list_foritm<f1arg>(f1as) 
  where {
    #impltmp
    foritm$work<f1arg>(f1a1) = diagnostic10_f1arg(out, f1a1)
  }

#implfun diagnostic10_d1gualst(out, d1gs) =
  list_foritm<d1gua>(d1gs) 
  where {
    #impltmp
    foritm$work<d1gua>(dgua) = diagnostic10_d1gua(out, dgua)
  }

#implfun diagnostic10_d1clslst(out, d1cs) =
  list_foritm<d1cls>(d1cs) 
  where {
    #impltmp
    foritm$work<d1cls>(d1cl) = diagnostic10_d1cls(out, d1cl)
  }

#implfun diagnostic10_d1eclist(out, dcls) = 
  list_foritm<d1ecl>(dcls) 
  where {
    #impltmp
    foritm$work<d1ecl>(dcl1) = diagnostic10_d1ecl(out, dcl1)
  }

#implfun diagnostic10_d1eclistopt(out, dopt) =
  case+ dopt of
  | optn_nil() => ()
  | optn_cons(d2cs) => diagnostic10_d1eclist(out, d2cs)

#implfun diagnostic10_q1arglst(out, q1as) =
  list_foritm<q1arg>(q1as) 
  where {
    #impltmp
    foritm$work<q1arg>(q1a1) = diagnostic10_q1arg(out, q1a1)
  }

#implfun diagnostic10_s1qaglst(out, sqas) =
  list_foritm<s1qag>(sqas) 
  where {
    #impltmp
    foritm$work<s1qag>(sqa1) = diagnostic10_s1qag(out, sqa1)
  }

#implfun diagnostic10_t1qaglst(out, tqas) =
  list_foritm<t1qag>(tqas) 
  where {
    #impltmp
    foritm$work<t1qag>(tqa1) = diagnostic10_t1qag(out, tqa1)
  }

#implfun diagnostic10_t1iaglst(out, tias) =
  list_foritm<t1iag>(tias) 
  where {
    #impltmp
    foritm$work<t1iag>(tia1) = diagnostic10_t1iag(out, tia1)
  }

#implfun diagnostic10_d1arglst(out, d1as) =
  list_foritm<d1arg>(d1as) 
  where {
    #impltmp
    foritm$work<d1arg>(d1a1) = diagnostic10_d1arg(out, d1a1)
  }

#implfun diagnostic10_teqd1exp(out, tdxp) =
  case+ tdxp of
  | TEQD1EXPnone() => ()
  | TEQD1EXPsome(teq1, d1e2) => diagnostic10_d1exp(out, d1e2)

#implfun diagnostic10_wths1exp(out, wsxp) =
  case+ wsxp of
  | WTHS1EXPnone() => ()
  | WTHS1EXPsome(twth, s1e1) => diagnostic10_s1exp(out, s1e1)

#implfun diagnostic10_d1valdcl(out, dval) = let
    val () = diagnostic10_d1pat(out, dpat)
    val () = diagnostic10_teqd1exp(out, tdxp)
    val () = diagnostic10_wths1exp(out, wsxp)
  end 
  where {
    val dpat = d1valdcl_get_dpat(dval)
    val tdxp = d1valdcl_get_tdxp(dval)
    val wsxp = d1valdcl_get_wsxp(dval)
  }

#implfun diagnostic10_d1vardcl(out, dvar) = let
    val () = diagnostic10_s1expopt(out, sres)
    val () = diagnostic10_teqd1exp(out, dini)
  end 
  where {
    val sres = d1vardcl_get_sres(dvar)
    val dini = d1vardcl_get_dini(dvar)
  }

#implfun diagnostic10_d1fundcl(out, dfun) = let
    val () = diagnostic10_f1arglst(out, fags)
    val () = diagnostic10_s1res(out, sres)
    val () = diagnostic10_teqd1exp(out, tdxp)
    val () = diagnostic10_wths1exp(out, wsxp)
  end 
  where {
    val fags = d1fundcl_get_farg(dfun)
    val sres = d1fundcl_get_sres(dfun)
    val tdxp = d1fundcl_get_tdxp(dfun)
    val wsxp = d1fundcl_get_wsxp(dfun)
  }

#implfun diagnostic10_d1cstdcl(out, dcst) = let
    val () = diagnostic10_d1arglst(out, dags)
    val () = diagnostic10_s1res(out, sres)
    val () = diagnostic10_teqd1exp(out, dres)
  end 
  where {
    val dags = d1cstdcl_get_darg(dcst)
    val sres = d1cstdcl_get_sres(dcst)
    val dres = d1cstdcl_get_dres(dcst)
  }

#implfun diagnostic10_d1parsed(out, dpar) = let
    val nerror = d1parsed_get_nerror(dpar)
  in
    if (nerror > 0) then let
        val parsed = d1parsed_get_parsed(dpar)
      in diagnostic10_d1eclistopt(out, parsed) 
      end 
    else ()
  end

#implfun diagnostic10_d1valdclist(out, d1vs) =
  list_foritm<d1valdcl>(d1vs) 
  where {
    #impltmp
    foritm$work<d1valdcl>(dval) = diagnostic10_d1valdcl(out, dval)
  }

#implfun diagnostic10_d1vardclist(out, d1vs) =
  list_foritm<d1vardcl>(d1vs) 
  where {
    #impltmp
    foritm$work<d1vardcl>(dvar) = diagnostic10_d1vardcl(out, dvar)
  }

#implfun diagnostic10_d1fundclist(out, d1fs) =
  list_foritm<d1fundcl>(d1fs) 
  where {
    #impltmp
    foritm$work<d1fundcl>(dfun) = diagnostic10_d1fundcl(out, dfun)
  }

#implfun diagnostic10_d1cstdclist(out, d1cs) =
  list_foritm<d1cstdcl>(d1cs) 
  where {
    #impltmp
    foritm$work<d1cstdcl>(dcst) = diagnostic10_d1cstdcl(out,dcst)
  }