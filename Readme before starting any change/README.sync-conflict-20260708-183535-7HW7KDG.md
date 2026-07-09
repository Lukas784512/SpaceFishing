# Readme before starting any change

Leia este arquivo antes de implementar, alterar ou gerar qualquer conteudo para o projeto.

Este repositorio foi limpo para recomecar do zero. O Rojo continua configurado e as pastas principais do DataModel foram preservadas, mas a cena, sprites, scripts de gameplay e logicas antigas foram removidos.

## Clausula petrea: preservar alteracoes manuais

Antes de qualquer alteracao feita pelo Codex em cenario, modelos 3D, iluminacao, camera, skybox, interface, efeitos visuais ou qualquer objeto salvo no DataModel, o estado atual do jogo deve ser tratado como a fonte de verdade.

Nunca recrie, regenere ou substitua o lobby, a iluminacao ou a UI inteira do zero quando o pedido for uma alteracao incremental. O fluxo obrigatorio e:

1. Ler os arquivos atuais que representam a area afetada, por exemplo `src/Workspace`, `default.project.json`, `src/StarterGui` e scripts visuais.
2. Identificar exatamente o que ja existe e o que deve ser preservado.
3. Fazer a menor mudanca possivel em cima do estado existente.
4. Preservar nomes, propriedades, filhos, posicoes, materiais, luzes, constraints, atributos e organizacao que nao estejam diretamente relacionados ao pedido.
5. Validar que a mudanca nao removeu conteudo manual ou detalhes visuais existentes sem pedido explicito do usuario.

Se o usuario avisar que fez alteracoes manuais diretamente no Roblox Studio e essas alteracoes ainda nao estiverem refletidas nos arquivos do projeto, pare antes de editar a mesma area. Primeiro peca para o usuario salvar/exportar/sincronizar essas alteracoes para os arquivos ou confirmar que elas podem ser descartadas. O Codex nao deve assumir que a versao antiga dos arquivos e mais correta que o que esta no Studio.

Para alteracoes manuais rapidas que precisam sobreviver ao Rojo, prefira criar objetos fora dos modelos gerenciados pelo Rojo, em objetos soltos no `Workspace` ou em um `Model` manual como:

```text
Workspace/StudioManualEdits
```

Como `Workspace` usa `$ignoreUnknownInstances: true`, objetos manuais desconhecidos no topo do `Workspace` nao devem ser apagados pelo sync. O mesmo principio vale para UI manual em `StarterGui`, desde que fique fora de objetos gerenciados por arquivos. Alteracoes feitas dentro de modelos ou telas ja gerenciados pelo Rojo podem ser sobrescritas no proximo sync se nao forem trazidas para os arquivos antes.

### Regra atual do lobby manual

O lobby principal `Workspace/SpaceFishingLobbyStatic` deve ser tratado como conteudo manual do Studio. Ele nao deve ser sincronizado diretamente pelo Rojo dentro de `Workspace`, porque isso pode reverter posicoes, cores, filhos e ajustes feitos manualmente no cenario.

O arquivo `src/Workspace/SpaceFishingLobbyStatic.model.json` fica apenas como template de fallback em `ServerStorage/SceneTemplates`. O script `WorldBootstrap.server.lua` so clona esse template quando o lobby nao existe no `Workspace`; se o lobby ja existe, ele nao substitui, nao limpa e nao reparenta nada.

Para novas adicoes feitas pelo Codex no cenario, use uma destas abordagens:

1. Preferencia: criar objetos novos e independentes em `Workspace/CodexAdditions`, com nomes unicos, sem editar ou substituir `Workspace/SpaceFishingLobbyStatic`.
2. Se a mudanca precisar alterar o lobby manual existente, primeiro sincronize/exporte o estado atual do Studio para os arquivos ou peca confirmacao explicita do usuario.
3. Nunca volte a mapear `src/Workspace/SpaceFishingLobbyStatic.model.json` diretamente para `Workspace/SpaceFishingLobbyStatic` sem autorizacao explicita.

Essa regra vale especialmente para:

- `src/Workspace/SpaceFishingLobbyStatic.model.json` e qualquer cenario fixo;
- propriedades de `Lighting` em `default.project.json`;
- objetos de `StarterGui` e scripts de interface;
- scripts de animacao visual, camera, efeitos, skybox e post-processing.

## Checklist do jogo

Antes de qualquer mudanca relacionada ao jogo, leia tambem:

```text
CHECKLIST_JOGO.md
```

Use esse arquivo para entender o objetivo geral do jogo e qual parte do desenvolvimento a mudanca atual esta tentando resolver.

Sempre que implementar, alterar ou finalizar algo do jogo, confira se essa entrega corresponde a algum item do checklist. Se corresponder e estiver realmente pronto, marque automaticamente o item como feito, trocando:

```text
- [ ] Item
```

por:

```text
- [x] Item
```

Nao marque itens parcialmente feitos. Se a mudanca ajudar em uma etapa, mas ainda nao concluir o item, deixe a caixa desmarcada. Se uma mudanca importante nao existir no checklist, mencione isso ao usuario e sugira atualizar o checklist antes de continuar.

## Rojo

O projeto sincroniza com Roblox Studio usando Rojo.

Para iniciar o servidor:

```bash
cd /Users/lucasgabrielnascimentodossantos/Documents/pescaria && rojo serve
```

A configuracao principal fica em:

```text
default.project.json
```

### Sincronizacao correta de cenario fixo

Para cenario fixo, como lobby, ilhas, lojas, decoracoes, spawn, areas de pesca e estruturas visuais principais, prefira sincronizar o conteudo diretamente pelo Rojo dentro de `src/Workspace` usando modelos/objetos estaticos.

Nao dependa de scripts de runtime para criar o chao principal ou o lobby inteiro quando o objetivo for ter a cena fixa salva no place. Se o script falhar, o jogador pode nascer sem mapa e cair infinitamente. O fluxo correto para esse projeto e:

1. Criar o cenario fixo em arquivos sincronizados pelo Rojo dentro de `src/Workspace`.
2. Deixar `Workspace` com `$ignoreUnknownInstances: true` em `default.project.json`, para o Rojo nao tentar apagar `Camera`, `Terrain`, `SpaceFishingLobbyStatic` manual e outros objetos nativos ou editados no Studio.
3. Colocar configuracoes fixas de iluminacao/ceu em `Lighting` dentro de `default.project.json`, quando fizerem parte da direcao visual do jogo.
4. Usar scripts de servidor apenas para comportamento, verificacoes, interacoes e sistemas dinamicos.
5. Se existir um bootstrap de apoio, ele deve detectar quando o modelo estatico ja esta sincronizado e nao duplicar o lobby.

Depois de alterar arquivos sincronizados pelo Rojo:

```bash
cd /Users/lucasgabrielnascimentodossantos/Documents/pescaria && rojo serve
```

No Roblox Studio, pare o Play, reconecte o plugin do Rojo se necessario, aceite as mudancas no painel de sync e so depois aperte Play.

Se apenas uma plataforma simples aparecer, mas o lobby completo nao, isso indica que o `Workspace` sincronizou, mas o conteudo final ainda nao entrou ou algum script de runtime falhou. O cenario principal nao deve depender desse tipo de fallback.

## Estrutura preservada

As pastas abaixo existem apenas como ponto de partida para novas implementacoes:

- `src/Workspace`
- `src/ReplicatedStorage`
- `src/ServerScriptService`
- `src/StarterGui`
- `src/StarterPack`
- `src/StarterPlayer/StarterPlayerScripts`
- `src/StarterPlayer/StarterCharacterScripts`

Nao existe mais cena pre-construida, sistema de pesca, sistema de animacao, sprites gerados, ferramentas de geracao de cena ou arquivo `.rbxlx` gerado neste projeto.

## Arquitetura de scripts

Nao concentre sistemas grandes em poucos scripts gigantes.

Use `ModuleScript` sempre que uma parte do jogo tiver logica propria, por exemplo:

- Sistema de inventario.
- Sistema de loja.
- Sistema de itens.
- Sistema de UI.
- Sistema de animacoes.
- Sistema de efeitos.
- Sistema de dados.
- Utilitarios compartilhados.

Scripts principais devem funcionar como pontos de entrada leves, apenas conectando modulos, eventos e servicos. A logica real deve ficar nos modulos.

Como regra pratica, se um script comecar a misturar varias responsabilidades, divida em modulos menores antes de continuar.

## Conteudo visual e estrutural

Sempre que for possivel, prefira deixar objetos, cenario, UI, ferramentas e assets visuais ja criados e salvos dentro do jogo no Roblox Studio, em vez de gerar tudo por script quando o jogo inicia.

O runtime deve criar apenas o que realmente precisa ser dinamico. Cenario fixo, objetos decorativos, interfaces principais, ferramentas base, modelos estaticos e referencias visuais devem existir previamente no DataModel/place.

Se for necessario gerar algo por codigo para acelerar producao, trate esse script como ferramenta temporaria de construcao:

1. Gere ou monte o conteudo uma vez em modo de edicao.
2. Confira visualmente se ficou correto.
3. Salve o resultado no Studio.
4. Remova ou desative o script temporario.
5. Deixe no runtime apenas scripts que controlam comportamento, interacao, estado e gameplay.

### Acabamento visual obrigatorio

A skill de modelos 3D pede estilo low poly/plastico inspirado em jogos Roblox coloridos como Grow a Garden. Isso nao significa deixar Parts grandes com material padrao cru.

Mesmo usando materiais nativos como `SmoothPlastic`, `Plastic`, `Neon`, `Metal` e `Grass`, todo objeto visual importante deve receber acabamento geometrico:

- patches de cor e fake texture em superficies grandes;
- highlights e sombras simples em placas, bordas e volumes;
- trims, molduras, parafusos, painéis e bevels falsos;
- variacao controlada de tons dentro da mesma paleta;
- detalhes grandes o suficiente para aparecer de longe;
- silhueta clara antes dos detalhes.

Evite entregar chao, predios, lojas, naves ou props principais como blocos lisos gigantes. Se a cena parecer feita com Part padrao do Roblox, ainda nao esta pronta visualmente.

## Sprites e imagens 2D

Sempre que for necessario colocar um sprite, icone, item visual 2D, personagem 2D, efeito visual 2D ou qualquer imagem dentro do jogo, nao crie esse sprite manualmente dentro do Roblox usando frames, CanvasGroups ou composicoes de UI feitas com pecas internas.

Para fazer upload automatico pela Roblox Open Cloud, carregue as credenciais a partir de um arquivo `.env` local, que nunca deve ser versionado. Use `.env.example` como referencia para as variaveis esperadas:

- `ROBLOX_API_KEY`
- `ROBLOX_USER_ID`, quando o asset for criado na conta do usuario
- `ROBLOX_GROUP_ID`, quando o asset for criado em um grupo

Nunca escreva a chave da Roblox em arquivos versionados, scripts commitados, logs ou mensagens publicas.

## Modelos 3D

Antes de criar ou alterar qualquer modelo 3D, leia:

```text
Skill 3D Modeling.md
```

Essa skill e a referencia obrigatoria para decisoes de forma, proporcao, composicao, organizacao, materiais e acabamento visual dos modelos 3D.

## Animacoes Roblox

Antes de criar, alterar, substituir ou conectar animacoes no Roblox, leia:

```text
Skill Roblox Animations.md
```

Sempre que um pedido mencionar animacao para o jogador sem dizer explicitamente que e para um NPC, assuma que o alvo correto e o personagem principal controlado pelo player:

```text
Player.Character
```

## Resumo operacional

- Leia este README antes de trabalhar no projeto.
- Preserve alteracoes manuais existentes antes de alterar cenario, iluminacao ou interface.
- Trate `Workspace/SpaceFishingLobbyStatic` como lobby manual preservado; novas adicoes de cenario feitas pelo Codex devem ir para `Workspace/CodexAdditions` ou ser incorporadas somente depois de sincronizar/exportar o estado atual do Studio.
- Leia `CHECKLIST_JOGO.md` antes de qualquer mudanca relacionada ao jogo.
- Use o checklist para entender a etapa atual e marque automaticamente itens concluidos.
- Use `rojo serve` na raiz do projeto para sincronizar com Roblox Studio.
- O projeto esta zerado: nao reutilize nomes, scripts ou assets removidos sem um pedido novo.
- Divida sistemas em modulos pequenos e claros.
- Prefira conteudo visual salvo no Studio quando ele for fixo.
- Use credenciais da Roblox apenas pelo `.env` local ignorado pelo Git.
- Para modelos 3D, siga `Skill 3D Modeling.md`.
- Para animacoes Roblox, siga `Skill Roblox Animations.md`.
