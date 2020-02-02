# Lösung zu debug-matcharg


# Sourcecode: match.arg()
function(arg, choices, several.ok = FALSE)
{
  # if no 'choice'-argument is submitted
  if (missing(choices)) {
    # calls the parent enivroments and gets the formal arguments of this 
    # environment
    formal.args <- formals(sys.function(sysP <- sys.parent()))
    # Evaluates the formal arguments in the parent environment and defines them
    # as 'choices'
    choices <- eval(formal.args[[as.character(substitute(arg))]],
                    envir = sys.frame(sysP))
  }
  if (is.null(arg)) # If 'arg == NULL' early exit
    return(choices[1L])
  else if (!is.character(arg))
    stop("'arg' must be NULL or a character vector")
  # per default: More than one element is forbidden. => severl.ok == FALSE
  if (!several.ok) {
    if (identical(arg, choices)) # default cases => early exit
      # returns the first argument of arg
      return(arg[1L])
    if (length(arg) > 1L)
      stop("'arg' must be of length 1")
  }
  # if 'several.ok == TRUE'
  else if (length(arg) == 0L)
    stop("'arg' must be of length >= 1")
  # seeks matches for the elements of 'arg' among those of 'choices'
  # and returns the indexes
  i <- pmatch(arg, choices, nomatch = 0L, duplicates.ok = TRUE)
  if (all(i == 0L)) # no match between 'arg' and 'choices'
    stop(gettextf("'arg' should be one of %s", paste(dQuote(choices),
                                                     collapse = ", ")),
         domain = NA)
  i <- i[i > 0L] # select all matches between 'choices' and 'arg'
  if (!several.ok && length(i) > 1) 
    stop("there is more than one match in 'match.arg'")
  choices[i]
}




