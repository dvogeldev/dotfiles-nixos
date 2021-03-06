# User configuration for autorandr

{
  # If no monitor layout can be detected, fallback to the laptop profile (it's defined below)
  services.autorandr.defaultTarget = "laptop";

  home-manager.users.dany.programs.autorandr = {
    profiles = {
      both = {
        config = {
          "HDMI-1" = {
            enable = true;
            mode = "1920x1080";
            position = "0x0";
            primary = true;
            rate = "60.00";
            # TODO: This will be possible when the 20.09 is released for home-manager
            # crtc 0
          };
          "eDP-1" = {
            enable = true;
            mode = "1920x1080";
            position = "0x1080";
            rate = "60.00";
            # TODO: This will be possible when the 20.09 is released for home-manager
            # crtc 1
          };
        };
        fingerprint = {
          "HDMI-1" = "00ffffffffffff0009d1327f455400002a19010380351e782e9de1a654549f260d5054a56b80d1c0317c4568457c6168617c953c3168023a801871382d40582c4500132a2100001e000000ff003741463034303935534c300a20000000fd0018780f8711000a202020202020000000fc0042656e5120584c323431315a0a015c020323f15090050403020111121314060715161f202309070765030c00100083010000023a801871382d40582c4500132a2100001f011d8018711c1620582c2500132a2100009f011d007251d01e206e285500132a2100001f8c0ad08a20e02d10103e9600132a210000190000000000000000000000000000000000000000c7";
          "eDP-1" = "00ffffffffffff000dae61130000000007180104a51d117802ce85a3574e9d2612505400000001010101010101010101010101010101363680a0703820402e1e240025a510000018242480a0703820402e1e240025a510000018000000fe00434d4e0a202020202020202020000000fe004e3133334853452d4541330a2000a1";
        };
      };
      external = {
        config = {
          "HDMI-1" = {
            enable = true;
            mode = "1920x1080";
            position = "0x0";
            primary = true;
            rate = "60.00";
            # TODO: This will be possible when the 20.09 is released for home-manager
            # crtc 0
          };
          "eDP-1".enable = false;
        };
        fingerprint = {
          "HDMI-1" = "00ffffffffffff0009d1327f455400002a19010380351e782e9de1a654549f260d5054a56b80d1c0317c4568457c6168617c953c3168023a801871382d40582c4500132a2100001e000000ff003741463034303935534c300a20000000fd0018780f8711000a202020202020000000fc0042656e5120584c323431315a0a015c020323f15090050403020111121314060715161f202309070765030c00100083010000023a801871382d40582c4500132a2100001f011d8018711c1620582c2500132a2100009f011d007251d01e206e285500132a2100001f8c0ad08a20e02d10103e9600132a210000190000000000000000000000000000000000000000c7";
          "eDP-1" = "00ffffffffffff000dae61130000000007180104a51d117802ce85a3574e9d2612505400000001010101010101010101010101010101363680a0703820402e1e240025a510000018242480a0703820402e1e240025a510000018000000fe00434d4e0a202020202020202020000000fe004e3133334853452d4541330a2000a1";
        };
      };
      laptop = {
        config = {
          "HDMI-1".enable = false;
          "eDP-1" = {
            enable = true;
            mode = "1920x1080";
            position = "0x0";
            primary = true;
            rate = "60.00";
            # TODO: This will be possible when the 20.09 is released for home-manager
            # crtc 0
          };
        };
        fingerprint = {
          "eDP-1" = "00ffffffffffff000dae61130000000007180104a51d117802ce85a3574e9d2612505400000001010101010101010101010101010101363680a0703820402e1e240025a510000018242480a0703820402e1e240025a510000018000000fe00434d4e0a202020202020202020000000fe004e3133334853452d4541330a2000a1";
        };
      };
    };
  };
}
