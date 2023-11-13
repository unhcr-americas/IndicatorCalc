# remotes::install_github("thinkr-open/checkhelper")
# checkhelper::print_globals()

globalVariables(unique(c(
  # mod_home_server:
  "parent_session",
  # fct_check_map:
  "standard", "variable",
  # fct_get_all_variable_names : <anonymous>:
  "vars",
  # fct_plot_indic_donut:
  "label", "raw.prc", "val",
  # fct_re_map:
  "df", "value", "variable",
  # fct_build_map:
  "label_mod", "map", "mappattern", "MeasureLevel", "name_mod", "QuestionVar", "thismapper",
  # fct_kobo_dummy:
  "list_name",
  # fct_plot_rbm_sdg:
  "geo_area_name", "indicator", "RMS", "series_description", "time_period_start",
  # fct_require:
  "IndName", "label_mod", "MeasureLevel", "name_mod", "QuestionVar",
  # fct_var_mapping:
  "best_label", "best_list_name", "best_match", "best_name", "best_type", "label_mod", "list_name", "matching_index_best", "matching_index_second_best", "mod", "name", "name_mod", "name_or", "name_var", "QuestionVar", "second_best", "second_label", "second_list_name", "second_name", "second_type", "type",
  # mod_variable_mapping_server:
  "file_type", "geographies", "kobo_asset_id", "operational_purpose_of_data", "title", "type"
)))
