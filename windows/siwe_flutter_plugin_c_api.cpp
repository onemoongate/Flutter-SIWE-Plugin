#include "include/siwe_flutter/siwe_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "siwe_flutter_plugin.h"

void SiweFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  siwe_flutter::SiweFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
