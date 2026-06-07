/**
 * Pretty links / redirects do Minha Confeitaria.
 *
 * Os pares slug → destino agora vivem em `redirects.config.json` (dados puros),
 * editáveis pelo painel ou na mão. A CHAVE vira /go/<slug> no seu domínio; o
 * VALOR é o link final (Hotmart, Kiwify, WhatsApp…). As UTMs do visitante vão
 * junto no redirect. Trocar oferta = mude o valor no JSON → push → no ar em ~2 min.
 */

import { defineRedirects } from 'web-kit/redirects';
import map from './redirects.config.json';

export const redirects = defineRedirects(map as Record<string, string>);
