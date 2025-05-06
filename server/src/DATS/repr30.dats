#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/templates.sats"
#staload "./../SATS/repr20.sats"
#staload "./../SATS/repr30.sats"

#staload "./../DATS/templates.dats"
#staload "./../DATS/repr20.dats"

#impltmp{x0} g_repr<d3lab(x0)> = d3lab_repr<x0>
#impltmp g_repr<d3pat> = d3pat_repr
#impltmp g_repr<d3exp> = d3exp_repr
#impltmp g_repr<f3arg> = f3arg_repr
#impltmp g_repr<d3gua> = d3gua_repr
#impltmp g_repr<d3gpt> = d3gpt_repr
#impltmp g_repr<d3cls> = d3cls_repr
#impltmp g_repr<timpl> = timpl_repr
#impltmp g_repr<d3ecl> = d3ecl_repr
#impltmp g_repr<d3valdcl> = d3valdcl_repr
#impltmp g_repr<d3vardcl> = d3vardcl_repr
#impltmp g_repr<d3fundcl> = d3fundcl_repr
#impltmp g_repr<d3parsed> = d3parsed_repr


#implfun d3pat_repr(d3p0) =
  case+
  d3p0.node() of
  | D3Pany() => repr("D3Pany(",")")
  | D3Pvar(d2v) => repr("D3Pvar(",d2v,")")
  //
  | D3Pint(tok) => repr("D3Pint(",tok,")")
  | D3Pbtf(sym) => repr("D3Pbtf(",sym,")")
  | D3Pchr(tok) => repr("D3Pchr(",tok,")")
  | D3Pstr(tok) => repr("D3Pstr(",tok,")")
  //
  |D3Pcon(d2c) => repr("D3Pcon(",d2c,")")
  //
  | D3Pbang(d3p1) => repr("D3Pbang(",d3p1,")")
  | D3Pflat(d3p1) => repr("D3Pflat(",d3p1,")")
  | D3Pfree(d3p1) => repr("D3Pfree(",d3p1,")")
  //
  | D3Psapp(d3f0, s2vs) => repr("D3Psapp(",d3f0,";",s2vs,")")
  | D3Psapq(d3f0, s2as) => repr("D3Psapq(",d3f0,";",s2as,")")
  //
  | D3Ptapq(d3p1, tjas) => repr("D3Ptapq(",d3p1,";",tjas,")")
  //
  | D3Pdap1(d3f0) => repr("D3Pdap1(", d3f0, ")")
  //
  | D3Pdapp(d3f0, npf1, d3ps) =>
    repr("D3Pdapp(", d3f0,";",npf1,";",d3ps,")")
  //
  | D3Ptup0(npf1, d3ps) => repr("D3Ptup0(",npf1,";",d3ps,")")
  | D3Ptup1(tknd, npf1, d3ps ) =>
    repr("D3Ptup1(", tknd,";",npf1,";",d3ps,")")
  | D3Prcd2(tknd, npf1, ldps) =>
    repr("D3Prcd2(", tknd,";",npf1,";",ldps,")")
  //
  | D3Pannot(d3p1, s1e2, s2e2) =>
    repr("D3Pannot(",d3p1,";",s1e2,";",s2e2,")")
  //
  | D3Pt2pck(d3p1, t2p2) =>
    repr("D3Pt2pck(",d3p1,";",t2p2,")")
  //
  | D3Pnone0() => repr("D3Pnone0(",")")
  | D3Pnone1(d2p1) => repr("D3Pnone1(",d2p1,")")
  | D3Pnone2(d3p1) => repr("D3Pnone2(",d3p1,")")
  //
  | D3Perrck(lvl1, d3p2) => repr("D3Perrck(",lvl1,";",d3p2,")")