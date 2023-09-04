### This is done to register the font from the package when it gets loaded!!

.onLoad <- function(libname, pkgname) {
  font_dir <- system.file("fonts", package = "IndicatorCalc")
  sysfonts::font_paths(font_dir)

  sysfonts::font_add(
    family = "Font Awesome 6 Free Solid",
    regular = "fa-solid-900.ttf"
  )
   
  showtext::showtext_auto(TRUE)

  ## For ragg
  sys_fonts <- systemfonts::system_fonts()
  if (!any(grepl("wesome", sys_fonts$family, ignore.case = TRUE)))
    systemfonts::register_font(name = "Font Awesome 6 Free Solid",
                               plain = file.path(font_dir, "fa-solid-900.ttf") )

}

.onUnload <- function(libpath) {
  showtext::showtext_auto(FALSE)
}
