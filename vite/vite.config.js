import { defineConfig } from 'vite';
import { resolve } from 'path';
import fs from 'fs';

const jsDir = resolve(__dirname, 'js');
const cssDir = resolve(__dirname, 'css');

const jsFiles = fs.readdirSync(jsDir).filter(file => file.endsWith('.js')).map(file => resolve(jsDir, file));

const cssFiles = fs.readdirSync(cssDir).filter(file => file.endsWith('.css')).map(file => resolve(cssDir, file));

const entries = jsFiles.reduce((acc, file) => {
  const name = file.split('/').pop().replace('.js', '');
  acc[name] = file;
  return acc;
}, {});

cssFiles.forEach(file => {
  const name = file.split('/').pop().replace('.css', '');
  entries[name] = file;
});

export default defineConfig({
  root: 'static',
  build: {
    outDir: '../../static/dist',
    emptyOutDir: true,
    rollupOptions: {
      input: entries,
      output: {
        entryFileNames: '[name].js',
        assetFileNames: '[name][extname]',
      },
    },
    manifest: true,
  },
});
