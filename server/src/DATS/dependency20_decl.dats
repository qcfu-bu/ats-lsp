#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/dependency20.sats"


#implfun dependency20_d2ecl(dp, d2cl, key0) =
  case+ d2cl.node() of
  | D2Clocal0(dcls1, dcls2) => let
      val () = dependency20_d2eclist(dp, dcls1, key0)
      val () = dependency20_d2eclist(dp, dcls2, key0)
    end
  | D2Cinclude(_, _, _, _, dopt) => (
    case+ dopt of
    | optn_nil() => ()
    | optn_cons(dcls) => dependency20_d2eclist(dp, dcls, key0))
  | D2Cstaload(stadyn, tok, src, fopt, s2opt) => (
    case+ fopt of
    | optn_cons(fpath) => let
        val key1 = fpath.fnm2()
        val () = 
          if depgraph_has(dp, key1) then ()
          else dependency20_s2taloadopt(dp, s2opt, key1)
        val () = depgraph_add(dp, key1, key0)
      end
    | optn_nil() => ())
  | _ => ()

#implfun dependency20_s2taloadopt(dp, s2opt, key0) =
  case+ s2opt of
  | S2TALOADdpar(stadyn, dpar) => let
    val () = dependency20_d2parsed(dp, dpar, key0)
    end
  | _ => ()

#implfun dependency20_d2eclist(dp, dcls, key0) =
  list_dependency20_fnp(dp, dcls, key0, dependency20_d2ecl)