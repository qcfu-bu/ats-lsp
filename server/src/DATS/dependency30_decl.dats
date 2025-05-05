#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/dependency30.sats"


#implfun dependency30_d3ecl(dp, d3cl, key0) =
  case+ d3cl.node() of
  | D3Clocal0(dcls1, dcls2) => let
      val () = dependency30_d3eclist(dp, dcls1, key0)
      val () = dependency30_d3eclist(dp, dcls2, key0)
    end
  | D3Cinclude(_, _, _, _, dopt) => (
    case+ dopt of
    | optn_nil() => ()
    | optn_cons(dcls) => dependency30_d3eclist(dp, dcls, key0))
  | D3Cstaload(stadyn, tok, src, fopt, s3opt) => (
    case+ fopt of
    | optn_cons(fpath) => let
        val key1 = fpath.fnm2().stmp()
        val () = depgraph_add(dp, key1, key0)
      in
        case+ s3opt of
        | S3TALOADdpar(stadyn, dpar) =>
          dependency30_d3parsed(dp, dpar, key1)
        | S3TALOADnone(s2opt) => 
          // TODO:
          ()
      end
    | optn_nil() => ())
  | _ => ()

#implfun dependency30_d3eclist(dp, dcls, key0) =
  list_dependency30_fnp(dp, dcls, key0, dependency30_d3ecl)