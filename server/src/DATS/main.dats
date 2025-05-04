#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/server.sats"
#staload "./../DATS/lsp_bootstrap.dats"

#implfun range_of_loctn(loc0) =
  let
    val lsrc0 = loc0.lsrc()
    val pbeg0 = loc0.pbeg()
    val pend0 = loc0.pend()
    val pbeg1 = position_make(pbeg0.nrow(), pbeg0.ncol()) 
    val pend1 = position_make(pend0.nrow(), pend0.ncol()) 
  in range_make(pbeg1, pend1)
  end

#implfun diagnostics_of_d3ecl(ds, dcl) =
  case+ dcl.node() of
  | D3Cerrck(lvl, d3cl) =>
    // auxmain(ds, dcl);
    if (lvl > 2) then () else let 
      val loc0 = dcl.lctn()
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val d = diagnostic_make(
        severity_error$make(), 
        range_of_loctn(loc0), 
        "hello", lsrc
      )
    in ds.push(d)
    end
  | _ => ()
  where {
    // fun auxmain(ds: diagnostics, dcl: d3exl) : void =
    //   case+ dcl.node() of
    //   | D3Cstatic(tknd, dcl1) => diagnostics_d3ecl(ds, dcl1)
    //   | D3Cextern(tknd, dcl1) => diagnostics_d3ecl(ds, dcl1)
    //   | D3Cdclst0(dcls) => diagnostics_d3ecl
  }

#implfun diagnostics_of_d3eclist(ds, dcls) = 
  list_foritm<d3ecl>(dcls)
  where {
    #impltmp
    foritm$work<d3ecl>(dcl) = diagnostics_of_d3ecl(ds, dcl)
  }

#implfun diagnostics_of_d3eclistopt(ds, dopt) = 
  case+ dopt of
  | optn_nil() => ()
  | optn_cons(d3cs) => diagnostics_of_d3eclist(ds, d3cs)

#implfun diagnostics_of_d3parsed(ds, dpar) = 
  let val nerror = dpar.nerror() in
    if (nerror > 0) then 
      let val parsed = d3parsed_get_parsed(dpar) 
      in diagnostics_of_d3eclistopt(ds, parsed)
      end
    else ()
  end

#implfun ats_validator(ds, uri) = 
  let 
    val path = url_to_path(uri)
    val dpar = d3parsed_of_fildats(path)
  in diagnostics_of_d3parsed(ds, dpar)
  end

// initialize the xatsopt environment
val _ = the_fxtyenv_pvsload()
val _ = the_tr12env_pvsl00d()
val () = xatsopt_flag$pvsadd0("--_XATSOPT_")
val () = xatsopt_flag$pvsadd0("--_SRCGEN2_XATSOPT_")

// boostrap the lsp server
val () = set_validator(ats_validator)
val () = connect()