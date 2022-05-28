import babel from "@rollup/plugin-babel";
import resolve from "@rollup/plugin-node-resolve";
import livereload from "rollup-plugin-livereload";

export default {
  input: "src/index.js",
  output: {
    dir: "dist",
    format: "esm",
  },
  plugins: [resolve(), babel({ babelHelpers: "bundled" }), livereload("dist")],
};
