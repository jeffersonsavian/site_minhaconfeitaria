<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
  xmlns:xhtml="http://www.w3.org/1999/xhtml">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Estilos compartilhados pelos dois modos (index e urlset) -->
  <xsl:template name="styles">
    <style>
      :root {
        --ink: #1a1714;        /* preto quente */
        --paper: #f4f1ec;      /* fundo claro */
        --card: #ffffff;
        --line: #e7e1d8;
        --muted: #8a8178;
        --accent: #d2691e;     /* âmbar (legível sobre branco) */
        --accent-soft: #fcf1e6;
      }
      * { margin: 0; padding: 0; box-sizing: border-box; }
      body {
        font-family: ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
        background: var(--paper);
        color: var(--ink);
        padding: 40px 20px;
        line-height: 1.5;
      }
      .container {
        max-width: 1040px; margin: 0 auto;
        background: var(--card);
        border: 1px solid var(--line);
        border-radius: 14px;
        overflow: hidden;
        box-shadow: 0 18px 50px -28px rgba(26, 23, 20, .35);
      }
      .header {
        background: var(--ink);
        color: #fff;
        padding: 30px 34px 26px;
        border-top: 3px solid var(--accent);
      }
      .eyebrow {
        font-size: 11px; letter-spacing: .26em; text-transform: uppercase;
        color: var(--accent); font-weight: 700; margin-bottom: 10px;
      }
      .header h1 { font-size: 25px; font-weight: 650; letter-spacing: -.01em; }
      .header .host { margin-top: 6px; font-size: 13px; color: #b9b2a8; font-family: ui-monospace, "Cascadia Code", Consolas, monospace; }
      .stats { display: flex; flex-wrap: wrap; gap: 14px; padding: 18px 34px; border-bottom: 1px solid var(--line); background: #faf8f4; }
      .pill {
        display: inline-flex; align-items: baseline; gap: 7px;
        background: var(--accent-soft); border: 1px solid #f0dcc8;
        padding: 7px 14px; border-radius: 999px;
      }
      .pill b { font-size: 16px; color: var(--accent); font-variant-numeric: tabular-nums; }
      .pill span { font-size: 12px; color: var(--muted); }
      table { width: 100%; border-collapse: collapse; }
      thead th {
        text-align: left; font-size: 11px; letter-spacing: .08em; text-transform: uppercase;
        color: var(--muted); font-weight: 700; padding: 14px 18px;
        border-bottom: 1px solid var(--line); background: #fbfaf7;
      }
      tbody td { padding: 13px 18px; border-bottom: 1px solid var(--line); font-size: 13.5px; vertical-align: middle; }
      tbody tr:last-child td { border-bottom: none; }
      tbody tr:hover { background: var(--accent-soft); }
      a { color: var(--accent); text-decoration: none; word-break: break-word; }
      a:hover { text-decoration: underline; }
      .num { font-variant-numeric: tabular-nums; color: var(--muted); white-space: nowrap; }
      .imgbadge {
        display: inline-block; min-width: 26px; text-align: center;
        background: var(--ink); color: #fff; font-size: 12px; font-weight: 600;
        padding: 2px 9px; border-radius: 999px; font-variant-numeric: tabular-nums;
      }
      .footer { padding: 18px 34px; font-size: 12px; color: var(--muted); }
      .footer a { color: var(--muted); text-decoration: underline; }
    </style>
  </xsl:template>

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="//sitemapindex">
        <xsl:call-template name="sitemapindex"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="urlset"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Índice de sitemaps (lista de sub-sitemaps) -->
  <xsl:template name="sitemapindex">
    <html lang="pt-BR">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Mapa do site — Índice</title>
        <xsl:call-template name="styles"/>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <div class="eyebrow">XML Sitemap</div>
            <h1>Índice do mapa do site</h1>
            <div class="host">Arquivo de índice · gerado automaticamente</div>
          </div>
          <div class="stats">
            <div class="pill"><b><xsl:value-of select="count(//sitemap)"/></b><span>sub-sitemaps</span></div>
          </div>
          <table>
            <thead>
              <tr>
                <th>Sitemap</th>
                <th style="width: 160px;">Última modificação</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="//sitemap">
                <tr>
                  <td><a href="{loc}"><xsl:value-of select="loc"/></a></td>
                  <td class="num"><xsl:value-of select="substring(lastmod, 1, 10)"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
          <div class="footer">
            Este mapa ajuda os buscadores a indexar o site. Padrão <a href="https://www.sitemaps.org/protocol.html">sitemaps.org</a>.
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- Conjunto de URLs -->
  <xsl:template name="urlset">
    <html lang="pt-BR">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Mapa do site</title>
        <xsl:call-template name="styles"/>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <div class="eyebrow">XML Sitemap</div>
            <h1>Mapa do site</h1>
            <div class="host">Lista completa de páginas · gerado automaticamente</div>
          </div>
          <div class="stats">
            <div class="pill"><b><xsl:value-of select="count(//url)"/></b><span>URLs</span></div>
            <div class="pill"><b><xsl:value-of select="count(//url[image:image])"/></b><span>com imagens</span></div>
          </div>
          <table>
            <thead>
              <tr>
                <th>URL</th>
                <th style="width: 90px; text-align:center;">Imagens</th>
                <th style="width: 150px;">Última modificação</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="//url">
                <tr>
                  <td><a href="{loc}"><xsl:value-of select="loc"/></a></td>
                  <td style="text-align:center;">
                    <xsl:if test="image:image">
                      <span class="imgbadge"><xsl:value-of select="count(image:image)"/></span>
                    </xsl:if>
                  </td>
                  <td class="num"><xsl:value-of select="substring(lastmod, 1, 10)"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
          <div class="footer">
            <xsl:value-of select="count(//url)"/> URLs neste sitemap. Destinado aos buscadores — padrão <a href="https://www.sitemaps.org/protocol.html">sitemaps.org</a>.
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
