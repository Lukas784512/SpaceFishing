# SpaceFishing

Projeto Roblox de pescaria espacial usando Git, Rojo, Roblox Studio e Codex.

## Fluxo oficial

Este projeto usa:

- 1 Dev Place por pessoa.
- 1 branch por tarefa/pessoa.
- GitHub Pull Request para juntar alteracoes.
- Rojo sincronizando apenas o place local de quem esta trabalhando.
- Main Place recebendo somente alteracoes aprovadas.

Places combinados:

- `SpaceFishing_Main`: versao oficial/aprovada.
- `Bruno`: Dev Place do Luks/Bruno.
- Dev Place do outro computador: usado pelo outro dev.

Importante: nao conecte dois Rojos no mesmo place. Se o painel do Rojo mostrar outro usuario sincronizando, alguem precisa desconectar ou cada pessoa deve usar seu proprio Dev Place.

## Primeira configuracao

Na raiz do projeto:

```bash
aftman install
./scripts/validate-rojo-project.sh
```

## Trabalhar no seu Dev Place

Exemplo para o Bruno:

```bash
./scripts/start-work-day.sh luks/minha-tarefa
./scripts/start-rojo.sh
```

Depois, no Roblox Studio:

1. Abra o place `Bruno`.
2. Abra o plugin do Rojo.
3. Confira se aparece o projeto `SpaceFishing`.
4. Conecte em `localhost:34872`.

## Ver alteracoes do outro dev

Quando o outro dev terminar algo:

1. Ele faz commit e push para a branch dele.
2. Ele abre Pull Request no GitHub.
3. Voce pode revisar no GitHub ou baixar a branch dele localmente:

```bash
git fetch origin
git switch nome-da-branch-dele
./scripts/start-rojo.sh
```

4. Abra o seu Dev Place `Bruno` e conecte o Rojo para testar a branch dele no seu Studio.

Quando o PR dele for aprovado e mergeado na `main`:

```bash
git switch main
git pull --ff-only
./scripts/start-rojo.sh
```

Assim voce ve as alteracoes aprovadas no seu Dev Place.

## Publicar no Main Place

Somente depois do merge na `main`:

```bash
git switch main
git pull --ff-only
./scripts/start-rojo.sh
```

Abra `SpaceFishing_Main`, conecte Rojo, teste e salve/publique.

## Leitura obrigatoria

Antes de pedir mudancas ao Codex:

- `Readme before starting any change/README.md`
- `CHECKLIST_JOGO.md`
- `WORKFLOW_DEV_PLACES.md`
- `CODEX_SAFETY_CHECKLIST.md`
