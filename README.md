# Minha Confeitaria — Site institucional (Astro)

Site estático (7 páginas) migrado do WordPress para **Astro 5**. Saída 100% HTML estático em `dist/`.

## Páginas
| URL | Arquivo |
|---|---|
| `/` | `src/pages/index.astro` |
| `/funcionalidades` | `src/pages/funcionalidades.astro` |
| `/precos` | `src/pages/precos.astro` |
| `/contato` | `src/pages/contato.astro` |
| `/politica-de-privacidade` | `src/pages/politica-de-privacidade.astro` |
| `/termos-de-uso` | `src/pages/termos-de-uso.astro` |
| `/aviso-legal` | `src/pages/aviso-legal.astro` |

## Desenvolvimento local
```bash
npm install
npm run dev      # http://localhost:4321
npm run build    # gera dist/
npm run preview  # serve o build
```

## SEO
- `<title>`, meta description, canonical, Open Graph e Twitter Card por página (componente `src/components/SEO.astro`).
- `sitemap-index.xml` gerado automaticamente (`@astrojs/sitemap`).
- `public/robots.txt` aponta para o sitemap.
- `site` definido em `astro.config.mjs` como `https://minhaconfeitaria.com.br` (necessário para canonical/sitemap corretos).

## Estratégia de deploy

O **build é feito localmente** e a pasta `dist/` é **versionada no Git**. O ServerAvatar
apenas serve `dist/` — **não precisa de Node nem de build no servidor**. Um hook
`pre-commit` (em `.githooks/`) reconstrói o `dist/` e o inclui em todo commit, então o
fluxo de trabalho continua só `git commit` + `git push`, sem risco de subir desatualizado.

> Para clonar em outra máquina e manter o hook ativo, rode uma vez:
> `git config core.hooksPath .githooks`

## Deploy no ServerAvatar (autopull, sem build no servidor)

1. **Aplicação**: crie uma aplicação **PHP/Static** (só serve arquivos — o aviso de
   extensões PHP/WordPress pode ser ignorado; o site é HTML puro).
2. **Git**: conecte ao repositório
   `git@github.com:jeffersonsavian/site_minhaconfeitaria.git`, branch `main`.
   - Copie a **Deploy Key** que o ServerAvatar gera e cole em
     *GitHub → repo → Settings → Deploy keys → Add deploy key* (read-only basta).
3. **Deployment Script**: **deixe vazio** (o `dist/` já vem pronto no repositório).
4. **Custom Webroot**: `dist` (faz o servidor servir `…/public_html/dist`).
5. **Auto Deploy (autopull)**: ative *Auto Deployment* e copie a **Webhook URL** do
   ServerAvatar para *GitHub → repo → Settings → Webhooks → Add webhook*
   (Content type `application/json`, evento *Just the push event*).
   A cada `git push` na branch `main`, o GitHub chama o webhook → ServerAvatar faz
   `git pull` do `dist/` já buildado → site atualizado.

### Formulário de contato → n8n
O form de `/contato` envia um `POST` JSON direto para um webhook do **n8n**
(constante `N8N_ENDPOINT` no `<script>` de `src/pages/contato.astro`). Payload:
`name, email, phone, subject, message, origem, pagina, enviadoEm`. Tem honeypot
anti-spam (`_gotcha`) e estados de enviando/sucesso/erro.

Para funcionar em produção:
1. Trocar `…/webhook-test/…` por `…/webhook/…` na constante (a URL `webhook-test`
   só responde com o editor do n8n em modo *Listen* e dispara uma vez).
2. No **nó Webhook** do n8n, habilitar **CORS / Allowed Origins** com
   `https://minhaconfeitaria.com.br` (senão o navegador bloqueia o envio).
3. Método `POST`, e responder 2xx para o site mostrar a tela de sucesso.

### Pendências para o cliente
- **WhatsApp**: o número `5511999999999` veio do HTML original — substitua pelo real.
