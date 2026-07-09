# Workflow com Dev Places

Este fluxo evita o erro de dois Rojos tentando sincronizar o mesmo place e reduz conflitos entre dois Codex.

## Estrutura

Use tres places/experiences:

- `SpaceFishing_Main`: versao oficial.
- `Bruno`: Dev Place do Luks/Bruno.
- Dev Place do outro dev: usado apenas pelo outro Mac.

Cada pessoa conecta Rojo somente no proprio Dev Place.

## Regra de ouro

GitHub sincroniza codigo entre os Macs.

Rojo sincroniza o codigo do Mac atual para o Roblox Studio aberto naquele Mac.

Nao use Rojo como ferramenta de colaboracao ao vivo entre dois Macs no mesmo place.

## Rotina do Bruno

```bash
git switch main
git pull --ff-only
git switch -c luks/nome-da-tarefa
./scripts/start-rojo.sh
```

No Roblox Studio:

1. Abra `Bruno`.
2. Conecte Rojo em `localhost:34872`.
3. Teste no Studio.

Ao terminar:

```bash
git status
git add caminho/dos/arquivos
git commit -m "Mensagem clara"
git push -u origin luks/nome-da-tarefa
```

Depois abra Pull Request para `main`.

## Rotina do outro dev

```bash
git switch main
git pull --ff-only
git switch -c irmao/nome-da-tarefa
./scripts/start-rojo.sh
```

No Roblox Studio:

1. Abra o Dev Place dele.
2. Conecte Rojo em `localhost:34872`.
3. Teste no Studio.

Ao terminar:

```bash
git status
git add caminho/dos/arquivos
git commit -m "Mensagem clara"
git push -u origin irmao/nome-da-tarefa
```

Depois abre Pull Request para `main`.

## Como ver alteracoes do outro dev antes do merge

Se ele subiu uma branch chamada `irmao/wave-system`:

```bash
git fetch origin
git switch irmao/wave-system
./scripts/start-rojo.sh
```

Abra seu Dev Place `Bruno`, conecte Rojo e teste.

Depois volte para sua branch:

```bash
git switch luks/sua-tarefa
```

## Como ver alteracoes aprovadas

Depois que o PR dele foi mergeado:

```bash
git switch main
git pull --ff-only
./scripts/start-rojo.sh
```

Abra `Bruno`, conecte Rojo e teste.

## Arquivos compartilhados

Estes arquivos precisam de combinacao antes de editar:

- `default.project.json`
- `GameConfig`
- `Remotes`
- `Types`
- `DataStore`
- modulos globais em `ReplicatedStorage`
- documentos de workflow
- scripts de inicializacao grandes

Regra: arquivo compartilhado so pode ser editado por uma pessoa por vez.

## Main Place

`SpaceFishing_Main` so deve ser aberto para sincronizar codigo depois do merge na `main`.

Nao teste branches experimentais no Main Place. Use sempre os Dev Places.

## Quando o Rojo mostrar o projeto errado

Se o painel do Rojo disser algo como `Project 'Roblox Luks'`, nao conecte no SpaceFishing.

Pare o Rojo errado e suba o certo:

```bash
./scripts/start-rojo.sh
```

O painel deve estar apontando para `localhost:34872` e o servidor deve vir de `SpaceFishing/default.project.json`.
