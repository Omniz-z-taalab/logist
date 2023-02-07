enum BuildModes { release, debug, profile }

class BuildMode {
  static BuildModes getMode() {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return BuildModes.release;
    }
    BuildModes result = BuildModes.profile;
    assert(() {
      result = BuildModes.debug;
      return true;
    }());
    return result;
  }
}
