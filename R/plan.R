# KU:
# - IPEDS ID: 155317
# - OPE ID: 00194800
# - unit ID: 155317

the_plan <- drake_plan(
  year = 2005:2018,
  opeid = "00194800",
  level_of_study = "undergraduate",
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
  ),
  # IPEDS
  ipeds_efte = get_ipeds_efte(year, level_of_study),
  ipeds_enrollment_headcount = get_ipeds_enrollment_headcount(year, level_of_study),
  ipeds_fall_retention = get_ipeds_fall_retention(year),
  ipeds_joined = get_ipeds_joined(ipeds_efte, ipeds_enrollment_headcount, ipeds_fall_retention),
  ipeds_joined_test = check_ipeds_joined_test(ipeds_joined)
)
