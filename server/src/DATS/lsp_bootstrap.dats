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