#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/dependency20.sats"

#implfun dependency20_d2exp(dp, d2e0, key) =
  case+ d2e0.node() of
  | D2Elet0(dcls, d2e1) => let
      val () = dependency20_d2eclist(dp, dcls, key)
      val () = dependency20_d2exp(dp, d2e1, key)
    end
  | D2Ewhere(d2e1, dcls) => let
      val () = dependency20_d2eclist(dp, dcls, key)
      val () = dependency20_d2exp(dp, d2e1, key)
    end
  | _ => ()

#implfun dependency20_d2explst(dp, d2es, key) =
  list_dependency20_fnp(dp, d2es, key, dependency20_d2exp)