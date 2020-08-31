# KU:
# - IPEDS ID: 155317
# - OPE ID: 00194800
# - unit ID: 155317

the_plan <- drake_plan(
  year = 2005:2018,
  opeid = "00194800",
  # FSA
  fsa_campus_based_volume = get_fsa_campus_based_volume(year, opeid),
  fsa_grants = get_fsa_grants(year, opeid),
  fsa_loans = get_fsa_loans(year, opeid),
  fsa_combined = get_fsa_combined(
    fsa_campus_based_volume,
    fsa_grants,
    fsa_loans
  ),
  fsa_recipients_plot = get_fsa_recipients_plot(
    fsa_combined
  )
)
