import {env} from 'node:process';
import browserslistToEsbuild from 'browserslist-to-esbuild';

const isDev = env.NODE_ENV === "development";

const config = {
  entryPoints: ['app/javascript/*.*'],
  bundle: true,
  sourcemap: isDev,
  format: 'esm',
  outdir: 'app/assets/builds',
  publicPath: '/assets',
  minify: !isDev,
  logLevel: 'info',
  target: browserslistToEsbuild()
};

export default config;
