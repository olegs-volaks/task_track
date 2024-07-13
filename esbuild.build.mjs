import {argv} from 'node:process'
import * as esbuild from 'esbuild'
import config from "./esbuild.config.mjs";

if (argv.includes('--watch')) {
  let ctx = await esbuild.context(config);

  await ctx.watch();
} else {
  await esbuild.build(config);
}
