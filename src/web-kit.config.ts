/**
 * Configuração do web-kit para o Minha Confeitaria.
 *
 * Para ATIVAR cada recurso, preencha os valores marcados com TODO e mude
 * `enabled` para true. O banner LGPD já funciona em modo `soft` (gating real
 * de pixel/ads). Quando o n8n estiver pronto, preencha as URLs dos webhooks.
 */

import { mergeLgpd } from 'web-kit/defaults';
import type { WebKitConfig } from 'web-kit/config';

export const config: WebKitConfig = {
  siteId: 'minhaconfeitaria',

  lgpd: mergeLgpd({
    mode: 'soft', // bloqueia pixel/ads até o aceite (site real)
    // TODO(n8n): URL do webhook que grava o consentimento no MySQL.
    // Sem isso o banner funciona, mas não registra a auditoria.
    consentWebhookUrl: undefined,
    texts: {
      privacyPolicyUrl: '/politica-de-privacidade',
    },
  }),

  // TODO(meta): preencher pixelId + capiWebhookUrl e mudar enabled para true.
  pixel: {
    enabled: false,
    pixelId: '',
    capiWebhookUrl: '',
    autoPageView: true,
  },

  // TODO(joinads): preencher clientId (ID do script JoinAds) e mudar enabled.
  // Os slots mapeiam nomes amigáveis -> joinadscode usados no conteúdo/MDX.
  ads: {
    enabled: false,
    provider: 'adx',
    clientId: '',
    slots: {
      'meio-artigo': 'Content1',
    },
  },
};
