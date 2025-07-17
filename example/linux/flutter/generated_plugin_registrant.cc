//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <progress_bar_chart/progress_bar_chart_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) progress_bar_chart_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ProgressBarChartPlugin");
  progress_bar_chart_plugin_register_with_registrar(progress_bar_chart_registrar);
}
