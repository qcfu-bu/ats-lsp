#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/dependency30.sats"

#implfun dependency30_d3exp(dp, d3e0, key) =
  case+ d3e0.node() of
  | D3Elet0(dcls, d3e1) => let
      val () = dependency30_d3eclist(dp, dcls, key)
      val () = dependency30_d3exp(dp, d3e1, key)
    end
  | D3Ewhere(d3e1, dcls) => let
      val () = dependency30_d3eclist(dp, dcls, key)
      val () = dependency30_d3exp(dp, d3e1, key)
    end
  | _ => ()

#implfun dependency30_d3explst(dp, d3es, key) =
  list_dependency30_fnp(dp, d3es, key, dependency30_d3exp)