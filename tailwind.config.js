// tailwind doesn't quote fonts for you...
let cjkFallback = [
  "'Noto Sans CJK TC'",
  "'Microsoft Jhenghei'",
  "'Microsoft Yahei'",
  "Meiryo",
  "'Malgun Gothic'",
];

module.exports = {
  purge: ["./dist/**/*.html"],
  mode: "jit",
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      sans: ["'M PLUS 1p'", ...cjkFallback, "sans-serif"],
      // serif: ["Equity"],
    },
    extend: {
      // https://github.com/tailwindlabs/tailwindcss/discussions/1361
      colors: {
        inherit: "inherit",
      },
      // Examples
      fontSize: {
        // base: ["16pt", { lineHeight: "1.6" }],
      },
      boxShadow: {
        // DEFAULT: "0 0 0.5rem #00000070",
        // md: "0 0 1rem #00000070",
        // white: "0 0 0.5rem #f8f6f7",
      },
      outline: {
        // a: "0.25rem solid #b16154",
      },
    },
  },
  variants: {
    extend: {},
  },
};
