{
  appLauncher = {
    autoPasteClipboard = false;
    clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
    clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
    clipboardWrapText = true;
    customLaunchPrefix = "nixGLNvidia";
    customLaunchPrefixEnabled = false;
    density = "default";
    enableClipPreview = true;
    enableClipboardChips = true;
    enableClipboardHistory = true;
    enableClipboardSmartIcons = true;
    enableSessionSearch = true;
    enableSettingsSearch = true;
    enableWindowsSearch = true;
    iconMode = "tabler";
    ignoreMouseInput = false;
    overviewLayer = false;
    pinnedApps = [ ];
    position = "center";
    screenshotAnnotationTool = "";
    showCategories = false;
    showIconBackground = false;
    sortByMostUsed = true;
    terminalCommand = "foot";
    viewMode = "list";
  };
  audio = {
    mprisBlacklist = [ "Firefox" ];
    preferredPlayer = "Spotify";
    spectrumFrameRate = 30;
    spectrumMirrored = true;
    visualizerType = "linear";
    volumeFeedback = false;
    volumeFeedbackSoundFile = "";
    volumeOverdrive = false;
    volumeStep = 1;
  };
  bar = {
    autoHideDelay = 500;
    autoShowDelay = 150;
    backgroundOpacity = 0.93;
    barType = "floating";
    capsuleColorKey = "none";
    capsuleOpacity = 1;
    contentPadding = 2;
    density = "comfortable";
    displayMode = "always_visible";
    enableExclusionZoneInset = true;
    fontScale = 1;
    frameRadius = 12;
    frameThickness = 8;
    hideOnOverview = false;
    marginHorizontal = 5;
    marginVertical = 5;
    middleClickAction = "settings";
    middleClickCommand = "";
    middleClickFollowMouse = true;
    monitors = [ ];
    mouseWheelAction = "none";
    mouseWheelWrap = true;
    outerCorners = true;
    position = "left";
    reverseScroll = false;
    rightClickAction = "controlCenter";
    rightClickCommand = "";
    rightClickFollowMouse = true;
    screenOverrides = [ ];
    showCapsule = true;
    showOnWorkspaceSwitch = true;
    showOutline = false;
    useSeparateOpacity = false;
    widgetSpacing = 6;
    widgets = {
      center = [
        {
          clockColor = "none";
          customFont = "";
          formatHorizontal = "HH:mm ddd, MMM dd";
          formatVertical = "MM dd (ddd) - HH  mm";
          id = "Clock";
          tooltipFormat = "HH:mm dddd, t,yyyy MMM dd";
          useCustomFont = false;
        }
        {
          colorizeDistroLogo = false;
          colorizeSystemIcon = "none";
          customIconPath = "";
          enableColorization = false;
          icon = "noctalia";
          id = "ControlCenter";
          useDistroLogo = false;
        }
      ];
      left = [
        {
          deviceNativePath = "";
          displayMode = "onhover";
          hideIfIdle = false;
          hideIfNotDetected = true;
          id = "Battery";
          showNoctaliaPerformance = false;
          showPowerProfiles = false;
        }
        {
          compactMode = false;
          diskPath = "/";
          iconColor = "none";
          id = "SystemMonitor";
          showCpuCores = false;
          showCpuFreq = false;
          showCpuTemp = true;
          showCpuUsage = true;
          showDiskAvailable = false;
          showDiskUsage = false;
          showDiskUsageAsPercent = false;
          showGpuTemp = false;
          showLoadAverage = false;
          showMemoryAsPercent = false;
          showMemoryUsage = true;
          showNetworkStats = true;
          showSwapUsage = false;
          textColor = "none";
          useMonospaceFont = true;
          usePadding = false;
        }
        {
          compactMode = false;
          hideMode = "hidden";
          hideWhenIdle = false;
          id = "MediaMini";
          maxWidth = 145;
          panelShowAlbumArt = true;
          scrollingMode = "hover";
          showAlbumArt = true;
          showArtistFirst = true;
          showProgressRing = true;
          showVisualizer = false;
          textColor = "none";
          useFixedWidth = false;
          visualizerType = "linear";
        }
        {
          colorName = "primary";
          hideWhenIdle = true;
          id = "AudioVisualizer";
          width = 100;
        }
        {
          characterCount = 2;
          colorizeIcons = false;
          emptyColor = "secondary";
          enableScrollWheel = true;
          focusedColor = "primary";
          followFocusedScreen = false;
          fontWeight = "bold";
          groupedBorderOpacity = 1;
          hideUnoccupied = false;
          iconScale = 0.8;
          id = "Workspace";
          labelMode = "index";
          occupiedColor = "secondary";
          pillSize = 0.6;
          showApplications = true;
          showApplicationsHover = false;
          showBadge = true;
          showLabelsOnlyWhenOccupied = true;
          unfocusedIconsOpacity = 1;
        }
      ];
      right = [
        {
          iconColor = "none";
          id = "KeepAwake";
          textColor = "none";
        }
        {
          iconColor = "none";
          id = "DarkMode";
        }
        {
          displayMode = "onhover";
          iconColor = "none";
          id = "Network";
          textColor = "none";
        }
        {
          displayMode = "onhover";
          iconColor = "none";
          id = "Bluetooth";
          textColor = "none";
        }
        {
          id = "Spacer";
          width = 20;
        }
        {
          displayMode = "alwaysShow";
          iconColor = "none";
          id = "Volume";
          middleClickCommand = "pwvucontrol || pavucontrol";
          textColor = "none";
        }
        {
          applyToAllMonitors = false;
          displayMode = "alwaysShow";
          iconColor = "none";
          id = "Brightness";
          textColor = "none";
        }
        {
          id = "Spacer";
          width = 20;
        }
        {
          blacklist = [ ];
          chevronColor = "none";
          colorizeIcons = false;
          drawerEnabled = true;
          hidePassive = false;
          id = "Tray";
          pinned = [ "Synology Drive Client 4.0.2\n\u6700\u65b0" ];
        }
        {
          colorizeSystemIcon = "none";
          enableColorization = false;
          generalTooltipText = "";
          hideMode = "alwaysExpanded";
          icon = "apps";
          id = "CustomButton";
          ipcIdentifier = "";
          leftClickExec = "noctalia-shell ipc call launcher toggle";
          leftClickUpdateText = false;
          maxTextLength = {
            horizontal = 10;
            vertical = 10;
          };
          middleClickExec = "";
          middleClickUpdateText = false;
          parseJson = false;
          rightClickExec = "";
          rightClickUpdateText = false;
          showExecTooltip = true;
          showIcon = true;
          showTextTooltip = true;
          textCollapse = "";
          textCommand = "";
          textIntervalMs = 3000;
          textStream = false;
          wheelDownExec = "";
          wheelDownUpdateText = false;
          wheelExec = "";
          wheelMode = "unified";
          wheelUpExec = "";
          wheelUpUpdateText = false;
          wheelUpdateText = false;
        }
        {
          hideWhenZero = false;
          hideWhenZeroUnread = false;
          iconColor = "none";
          id = "NotificationHistory";
          showUnreadBadge = true;
          unreadBadgeColor = "primary";
        }
      ];
    };
  };
  brightness = {
    backlightDeviceMappings = [ ];
    brightnessStep = 5;
    enableDdcSupport = false;
    enforceMinimum = true;
  };
  calendar = {
    cards = [
      {
        enabled = true;
        id = "calendar-header-card";
      }
      {
        enabled = true;
        id = "calendar-month-card";
      }
      {
        enabled = true;
        id = "timer-card";
      }
      {
        enabled = true;
        id = "weather-card";
      }
    ];
  };
  colorSchemes = {
    darkMode = true;
    generationMethod = "tonal-spot";
    manualSunrise = "06:30";
    manualSunset = "18:30";
    monitorForColors = "";
    predefinedScheme = "Eldritch";
    schedulingMode = "off";
    syncGsettings = true;
    useWallpaperColors = false;
  };
  controlCenter = {
    cards = [
      {
        enabled = true;
        id = "profile-card";
      }
      {
        enabled = true;
        id = "shortcuts-card";
      }
      {
        enabled = true;
        id = "audio-card";
      }
      {
        enabled = true;
        id = "brightness-card";
      }
      {
        enabled = true;
        id = "weather-card";
      }
      {
        enabled = true;
        id = "media-sysmon-card";
      }
    ];
    diskPath = "/";
    position = "close_to_bar_button";
    shortcuts = {
      left = [
        { id = "Network"; }
        { id = "Bluetooth"; }
        { id = "WallpaperSelector"; }
      ];
      right = [
        { id = "Notifications"; }
        { id = "PowerProfile"; }
        { id = "KeepAwake"; }
        { id = "NightLight"; }
      ];
    };
  };
  desktopWidgets = {
    enabled = true;
    gridSnap = true;
    gridSnapScale = true;
    monitorWidgets = [
      {
        name = "DP-1";
        widgets = [
          {
            clockStyle = "analog";
            customFont = "";
            format = "HH:mm\\nd MMMM yyyy";
            id = "Clock";
            roundedCorners = true;
            scale = 2.80427257060134;
            showBackground = true;
            useCustomFont = false;
            usePrimaryColor = false;
            x = 3360;
            y = 1680;
          }
          {
            hideMode = "visible";
            id = "MediaPlayer";
            roundedCorners = true;
            scale = 0.8996594750684824;
            showAlbumArt = true;
            showBackground = true;
            showButtons = true;
            showVisualizer = true;
            visualizerType = "linear";
            x = 3420;
            y = 960;
          }
          {
            id = "Weather";
            scale = 1.4093978900653534;
            showBackground = true;
            x = 3420;
            y = 1500;
          }
          {
            diskPath = "/";
            id = "SystemStat";
            layout = "bottom";
            roundedCorners = true;
            scale = 1.501621992568161;
            showBackground = true;
            statType = "CPU";
            x = 3420;
            y = 60;
          }
          {
            colorName = "primary";
            height = 72;
            hideWhenIdle = false;
            id = "AudioVisualizer";
            roundedCorners = true;
            scale = 1.5;
            showBackground = true;
            visualizerType = "linear";
            width = 320;
            x = 3300;
            y = 1080;
          }
          {
            diskPath = "/";
            id = "SystemStat";
            layout = "bottom";
            roundedCorners = true;
            scale = 1.5;
            showBackground = true;
            statType = "Memory";
            x = 3420;
            y = 300;
          }
          {
            diskPath = "/";
            id = "SystemStat";
            layout = "bottom";
            roundedCorners = true;
            scale = 1.5;
            showBackground = true;
            statType = "Network";
            x = 3000;
            y = 60;
          }
          {
            diskPath = "/var/home";
            id = "SystemStat";
            layout = "bottom";
            roundedCorners = true;
            scale = 1.5;
            showBackground = true;
            statType = "Disk";
            x = 3000;
            y = 300;
          }
        ];
      }
    ];
    overviewEnabled = true;
  };
  dock = {
    animationSpeed = 1;
    backgroundOpacity = 1;
    colorizeIcons = false;
    deadOpacity = 0.6;
    displayMode = "auto_hide";
    dockType = "floating";
    enabled = false;
    floatingRatio = 1;
    groupApps = false;
    groupClickAction = "cycle";
    groupContextMenuMode = "extended";
    groupIndicatorStyle = "dots";
    inactiveIndicators = false;
    indicatorColor = "primary";
    indicatorOpacity = 0.6;
    indicatorThickness = 3;
    launcherIcon = "";
    launcherIconColor = "none";
    launcherPosition = "end";
    launcherUseDistroLogo = false;
    monitors = [ ];
    onlySameOutput = true;
    pinnedApps = [ "firefox-nightly" ];
    pinnedStatic = false;
    position = "bottom";
    showDockIndicator = false;
    showLauncherIcon = false;
    sitOnFrame = false;
    size = 1;
  };
  general = {
    allowPanelsOnScreenWithoutBar = true;
    allowPasswordWithFprintd = false;
    animationDisabled = false;
    animationSpeed = 1;
    autoStartAuth = false;
    avatarImage = "/home/frort/.face";
    boxRadiusRatio = 1;
    clockFormat = "hh\\nmm";
    clockStyle = "custom";
    compactLockScreen = false;
    dimmerOpacity = 0.2;
    enableBlurBehind = true;
    enableLockScreenCountdown = true;
    enableLockScreenMediaControls = false;
    enableShadows = true;
    forceBlackScreenCorners = false;
    iRadiusRatio = 1;
    keybinds = {
      keyDown = [
        "Down"
        "Ctrl+N"
        "Ctrl+J"
      ];
      keyEnter = [
        "Return"
        "Enter"
      ];
      keyEscape = [ "Esc" ];
      keyLeft = [ "Left" ];
      keyRemove = [ "Del" ];
      keyRight = [ "Right" ];
      keyUp = [
        "Up"
        "Ctrl+P"
        "Ctrl+K"
      ];
    };
    language = "ja";
    lockOnSuspend = true;
    lockScreenAnimations = false;
    lockScreenBlur = 0;
    lockScreenCountdownDuration = 10000;
    lockScreenMonitors = [ ];
    lockScreenTint = 0;
    passwordChars = false;
    radiusRatio = 1;
    reverseScroll = false;
    scaleRatio = 1;
    screenRadiusRatio = 1;
    shadowDirection = "bottom_right";
    shadowOffsetX = 2;
    shadowOffsetY = 3;
    showChangelogOnStartup = true;
    showHibernateOnLockScreen = false;
    showScreenCorners = false;
    showSessionButtonsOnLockScreen = true;
    smoothScrollEnabled = true;
    telemetryEnabled = false;
  };
  hooks = {
    colorGeneration = "";
    darkModeChange = "";
    enabled = false;
    performanceModeDisabled = "";
    performanceModeEnabled = "";
    screenLock = "";
    screenUnlock = "";
    session = "";
    startup = "";
    wallpaperChange = "";
  };
  idle = {
    customCommands = "[]";
    enabled = false;
    fadeDuration = 5;
    lockCommand = "";
    lockTimeout = 660;
    resumeLockCommand = "";
    resumeScreenOffCommand = "";
    resumeSuspendCommand = "";
    screenOffCommand = "";
    screenOffTimeout = 600;
    suspendCommand = "";
    suspendTimeout = 1800;
  };
  location = {
    analogClockInCalendar = false;
    autoLocate = false;
    firstDayOfWeek = -1;
    hideWeatherCityName = false;
    hideWeatherTimezone = false;
    name = "Chofu";
    showCalendarEvents = true;
    showCalendarWeather = true;
    showWeekNumberInCalendar = false;
    use12hourFormat = false;
    useFahrenheit = false;
    weatherEnabled = true;
    weatherShowEffects = true;
    weatherTaliaMascotAlways = false;
  };
  network = {
    bluetoothAutoConnect = true;
    bluetoothDetailsViewMode = "grid";
    bluetoothHideUnnamedDevices = false;
    bluetoothRssiPollIntervalMs = 10000;
    bluetoothRssiPollingEnabled = false;
    disableDiscoverability = false;
    networkPanelView = "wifi";
    wifiDetailsViewMode = "list";
  };
  nightLight = {
    autoSchedule = true;
    dayTemp = "6500";
    enabled = false;
    forced = false;
    manualSunrise = "06:30";
    manualSunset = "18:30";
    nightTemp = "4000";
  };
  noctaliaPerformance = {
    disableDesktopWidgets = true;
    disableWallpaper = true;
  };
  notifications = {
    backgroundOpacity = 1;
    clearDismissed = true;
    criticalUrgencyDuration = 15;
    density = "default";
    enableBatteryToast = true;
    enableKeyboardLayoutToast = true;
    enableMarkdown = false;
    enableMediaToast = false;
    enabled = true;
    location = "bottom_left";
    lowUrgencyDuration = 3;
    monitors = [ ];
    normalUrgencyDuration = 8;
    overlayLayer = true;
    respectExpireTimeout = true;
    saveToHistory = {
      critical = true;
      low = true;
      normal = true;
    };
    sounds = {
      criticalSoundFile = "";
      enabled = false;
      excludedApps = "discord,firefox,chrome,chromium,edge";
      lowSoundFile = "";
      normalSoundFile = "";
      separateSounds = false;
      volume = 0.5;
    };
  };
  osd = {
    autoHideMs = 2000;
    backgroundOpacity = 1;
    enabled = true;
    enabledTypes = [
      0
      1
      2
      4
      3
    ];
    location = "bottom_left";
    monitors = [ ];
    overlayLayer = true;
  };
  plugins = {
    autoUpdate = false;
    notifyUpdates = true;
  };
  sessionMenu = {
    countdownDuration = 5000;
    enableCountdown = true;
    largeButtonsLayout = "grid";
    largeButtonsStyle = false;
    position = "center";
    powerOptions = [
      {
        action = "lock";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "1";
      }
      {
        action = "suspend";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "2";
      }
      {
        action = "hibernate";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "3";
      }
      {
        action = "reboot";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "4";
      }
      {
        action = "logout";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "5";
      }
      {
        action = "shutdown";
        command = "";
        countdownEnabled = true;
        enabled = true;
        keybind = "6";
      }
    ];
    showHeader = true;
    showKeybinds = true;
  };
  settingsVersion = 59;
  systemMonitor = {
    batteryCriticalThreshold = 5;
    batteryWarningThreshold = 20;
    cpuCriticalThreshold = 90;
    cpuWarningThreshold = 80;
    criticalColor = "";
    diskAvailCriticalThreshold = 10;
    diskAvailWarningThreshold = 20;
    diskCriticalThreshold = 90;
    diskWarningThreshold = 80;
    enableDgpuMonitoring = false;
    externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
    gpuCriticalThreshold = 90;
    gpuWarningThreshold = 80;
    memCriticalThreshold = 90;
    memWarningThreshold = 80;
    swapCriticalThreshold = 90;
    swapWarningThreshold = 80;
    tempCriticalThreshold = 90;
    tempWarningThreshold = 80;
    useCustomColors = false;
    warningColor = "";
  };
  templates = {
    activeTemplates = [ ];
    enableUserTheming = false;
  };
  ui = {
    boxBorderEnabled = false;
    fontDefault = "Noto Sans CJK JP";
    fontDefaultScale = 1;
    fontFixed = "Hack Nerd Font";
    fontFixedScale = 1;
    panelBackgroundOpacity = 0.92;
    panelsAttachedToBar = true;
    scrollbarAlwaysVisible = true;
    settingsPanelMode = "attached";
    settingsPanelSideBarCardStyle = false;
    tooltipsEnabled = true;
    translucentWidgets = false;
  };
  wallpaper = {
    automationEnabled = true;
    directory = "/home/frort/Pictures/Wallpapers";
    enableMultiMonitorDirectories = false;
    enabled = true;
    favorites = [ ];
    fillColor = "#000000";
    fillMode = "crop";
    hideWallpaperFilenames = false;
    linkLightAndDarkWallpapers = true;
    monitorDirectories = [ ];
    overviewBlur = 0.4;
    overviewEnabled = false;
    overviewTint = 0.6;
    panelPosition = "follow_bar";
    randomIntervalSec = 3600;
    setWallpaperOnAllMonitors = true;
    showHiddenFiles = false;
    skipStartupTransition = false;
    solidColor = "#1a1a2e";
    sortOrder = "name";
    transitionDuration = 1500;
    transitionType = [
      "fade"
      "disc"
      "stripes"
      "wipe"
      "pixelate"
      "honeycomb"
    ];
    useOriginalImages = false;
    useSolidColor = false;
    useWallhaven = false;
    viewMode = "single";
    wallhavenApiKey = "";
    wallhavenCategories = "111";
    wallhavenOrder = "desc";
    wallhavenPurity = "100";
    wallhavenQuery = "";
    wallhavenRatios = "";
    wallhavenResolutionHeight = "";
    wallhavenResolutionMode = "atleast";
    wallhavenResolutionWidth = "";
    wallhavenSorting = "relevance";
    wallpaperChangeMode = "random";
  };
}
