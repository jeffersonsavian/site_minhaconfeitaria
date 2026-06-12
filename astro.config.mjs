// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import { buildSitemapEnhancer } from 'web-kit/sitemap';
import sitemapImages from 'web-kit/sitemap-images';

const enhancer = buildSitemapEnhancer({
  site: 'https://minhaconfeitaria.com.br',
  collections: [],
  pagesDir: 'src/pages',
});

// https://astro.build
export default defineConfig({
  site: 'https://minhaconfeitaria.com.br',
  output: 'static',
  build: {
    // gera /sobre/index.html em vez de /sobre.html (URLs limpas)
    format: 'directory',
  },
  integrations: [
    // Pretty links /go/* são noindex e não entram no sitemap.
    sitemap({
      filter: (page) => !page.includes('/go/'),
      serialize: enhancer.serialize,
      xslURL: enhancer.xslURL,
    }),
    sitemapImages(),
  ],
});
