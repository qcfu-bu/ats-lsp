#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"

#extern fun url_to_path(uri: url) : string = $extnam()
#extern fun severity_error$make() : severity = $extnam()
#extern fun severity_warn$make()  : severity = $extnam()
#extern fun severity_hint$make()  : severity = $extnam()
#extern fun severity_info$make()  : severity = $extnam()

#extern fun position_make(
  line: int,
  offs: int
) : position = $extnam()

#extern fun range_make(
  pbeg: position,
  pend: position
) : range = $extnam()

#implfun range_of_loctn(loc0) =
  let
    val lsrc0 = loc0.lsrc()
    val pbeg0 = loc0.pbeg()
    val pend0 = loc0.pend()
    val pbeg1 = position_make(pbeg0.nrow(), pbeg0.ncol()) 
    val pend1 = position_make(pend0.nrow(), pend0.ncol()) 
  in range_make(pbeg1, pend1)
  end

#extern fun diagnostic_make(
  severity: severity,
  location: range, 
  message: string,
  source: string
) : diagnostic = $extnam()

#extern fun diagnostic_make(
  severity: severity,
  location: range, 
  message: string,
  source: string
) : diagnostic = $extnam()

#extern fun diagnostics_push(
  ds: diagnostics, 
  d: diagnostic
) : void = $extnam() 
#symload push with diagnostics_push

#extern fun set_validator(f: (diagnostics, url) -> void) : void = $extnam()
#extern fun connect() : void = $extnam()