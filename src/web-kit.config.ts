/**
 * Configuração do web-kit para o Minha Confeitaria.
 *
 * Os VALORES agora vivem em `web-kit.config.json` (dados puros) — editáveis
 * pelo painel ou na mão. Este arquivo só aplica os defaults via buildConfig.
 * Para ativar Pixel/Ads: edite o JSON (enabled + IDs) — direto ou pelo painel.
 */

import data from './web-kit.config.json';
import { buildConfig, type WebKitConfigInput } from 'web-kit/defaults';
import type { WebKitConfig } from 'web-kit/config';

export const config: WebKitConfig = buildConfig(data as WebKitConfigInput);
