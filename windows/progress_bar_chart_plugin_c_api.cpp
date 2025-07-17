#include "include/progress_bar_chart/progress_bar_chart_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "progress_bar_chart_plugin.h"

void ProgressBarChartPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  progress_bar_chart::ProgressBarChartPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
