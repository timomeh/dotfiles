// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 13,

    // font family with optional fallbacks
    fontFamily: '"Fira Mono"',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(251, 140, 0, 1)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // set to true for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: '#fff',

    windowSize: [1030, 600],

    // terminal background color
    backgroundColor: 'rgba(4, 7, 8, 0.7)',

    // border color (window, tabs)
    borderColor: 'transparent',

    // custom css to embed in the main window
    css: `
      .tabs_nav {
        margin-left: -1px;
        margin-right: -1px;
        margin-top: -1px;
        height: 38px;
        line-height: 37px;
      }

      .tabs_list {
        margin-left: 78px;
      }

      .tab_tab {
        height: 38px;
        color: white !important;
        background: linear-gradient(to bottom, rgba(12, 18, 21, 0.4), rgba(12, 18, 21, 0.5));
        border-bottom: 1px solid rgba(12, 18, 21, 0.6) !important;
        border-left: 1px solid transparent;
        border-right: 1px solid transparent;
      }

      .tabs_borderShim {
        width: 78px;
        height: 38px;
        background: linear-gradient(to bottom, rgba(12, 18, 21, 0.4), rgba(12, 18, 21, 0.5));
        border-bottom: 1px solid rgba(12, 18, 21, 0.6) !important;
      }

      .tab_text {
        opacity: 0.4;
        height: 37px;
        transition: opacity 200ms;
        position: absolute;
      }

      .tab_text:not(.tab_textActive):hover {
        opacity: .7;
      }

      .tab_textActive {
        opacity: 1;
      }

      .tab_active {
        border-left: 1px solid rgba(12, 18, 21, 0.6) !important;
        border-right: 1px solid rgba(12, 18, 21, 0.6) !important;
        background: none;
        border-bottom: none !important;
      }

      .tab_tab:last-of-type {
        border-right: 1px solid transparent !important;
      }

      .tab_icon {
        opacity: 0.7;
        left: 12px;
        right: auto;
        color: white;
        top: 9px;
        width: 20px;
        height: 20px;
        cursor: pointer !important;
      }

      .tab_shape {
        left: 7px !important;
        top: 7px !important;
      }

      .splitpane_divider {
        margin-top: 3px;
        background-color: rgba(207, 216, 220, 0.2) !important;
      }
    `,

    // custom css to embed in the terminal window
    termCSS: `
    `,

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '6px 4px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#192125',
      red: '#F44336',
      green: '#8BC34A',
      yellow: '#FFB300',
      blue: '#03A9F4',
      magenta: '#E91E63',
      cyan: '#00BCD4',
      white: '#FAFAFA',
      lightBlack: '#757575',
      lightRed: '#EF5350',
      lightGreen: '#AED581',
      lightYellow: '#FFCA28',
      lightBlue: '#4FC3F7',
      lightMagenta: '#AB47BC',
      lightCyan: '#26C6DA',
      lightWhite: '#FFFFFF'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    // make sure to use a full path if the binary name doesn't work
    // (e.g `C:\\Windows\\System32\\bash.exe` instead of just `bash.exe`)
    // if you're using powershell, make sure to remove the `--login` below
    shell: '/usr/local/bin/zsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    quickEdit: false,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg

    hyperStatusLine: {
      footerTransparent: false,
    },

    summonShortcut: 'Cmd+Ctrl+J',

    paneNavigation: {
      indicatorStyle: {
        position: 'absolute',
        top: 3,
        right: 0,
        fontSize: '10px',
        backgroundColor: '#D81B60',
        paddingLeft: 12,
        paddingRight: 8,
        lineHeight: 2.4,
        borderBottomLeftRadius: 15,
        borderTopLeftRadius: 15,
      }
    }
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hyperterm-tabs",
    "hyper-statusline",
    "hypercwd",
    "hyperterm-focus-reporting",
    "hyperlinks",
    "hyper-pane",
    "hyper-transparent-dynamic",
    "hyperterm-cursor",
    "hyperterm-summon"
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
