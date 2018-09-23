module.exports.decorateConfig = config => {
  const colors = {
    background: 'hsla(250, 16%, 15%, 0.90)',
    foreground: 'hsla(250, 0%, 70%, 1)',
    black: 'hsla(220, 9%, 13%, 1)',
    red: 'hsla(341, 60%, 81%, 1)',
    green: 'hsla(161, 70%, 58%, 1)',
    yellow: 'hsla(49, 84%, 69%, 1)',
    blue: 'hsla(211, 69%, 80%, 1)',
    magenta: 'hsla(294, 84%, 69%, 1)',
    cyan: 'hsla(186, 76%, 68%, 1)',
    white: 'hsla(186, 0%, 83%, 1)',
    lightBlack: 'hsla(210, 19%, 41%, 1)',
    lightRed: 'hsla(334, 100%, 87%, 1)',
    lightGreen: 'hsla(161, 70%, 75%, 1)',
    lightYellow: 'hsla(42, 100%, 53%, 1)',
    lightBlue: 'hsla(211, 68%, 76%, 1)',
    lightMagenta: 'hsla(287, 100%, 87%, 1)',
    lightCyan: 'hsla(186, 76%, 85%, 1)',
    lightWhite: 'hsla(186, 0%, 94%, 1)',
    cursorColor: 'hsla(45, 80%, 50%, 1)',
  }
  return Object.assign({}, config, {
    foregroundColor: colors.foreground,
    backgroundColor: colors.background,
    borderColor: 'transparent',
    cursorColor: colors.lightMagenta,
    colors: {
      black: colors.black,
      red: colors.red,
      green: colors.green,
      yellow: colors.yellow,
      blue: colors.blue,
      magenta: colors.lightMagenta,
      cyan: colors.cyan,
      white: colors.white,
      lightBlack: colors.lightBlack,
      lightRed: colors.lightRed,
      lightGreen: colors.lightGreen,
      lightYellow: colors.lightYellow,
      lightBlue: colors.lightBlue,
      lightMagenta: colors.lightMagenta,
      lightCyan: colors.lightCyan,
      lightWhite: colors.lightWhite,
    },
    css: `
      ${config.css || ''}
      .hyperterm_main {
        border: none !important;
      }
      .tab_tab {
        border: 0;
        opacity: 0.5;
      }
      .tab_active {
        opacity: 1;
      }
      .tab_textActive {
        opacity: 1;
        border-bottom: 1px solid ${colors.lightMagenta};
      }
      .splitpane_divider {
        background-color: ${colors.lightBlack} !important;
      }
      .splitpane_pane > .term_fit {
        opacity: 0.666;
        transition: 0.15s ease-in-out;
      }
      .splitpane_pane > .term_fit.term_active {
        opacity: 1;
      }
    `,
  })
}
