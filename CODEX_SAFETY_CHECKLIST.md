# Checklist de seguranca para Codex

Antes de qualquer alteracao:

- [ ] Estou em uma branch propria, nao trabalhando direto na `main`.
- [ ] Rodei `git status`.
- [ ] Rodei `git pull --ff-only` antes de criar/atualizar a branch.
- [ ] Li `Readme before starting any change/README.md`.
- [ ] Li `CHECKLIST_JOGO.md` se a tarefa mexe em gameplay, mapa, UI ou sistemas do jogo.
- [ ] Sei quais arquivos serao alterados.
- [ ] Confirmei que o outro dev nao esta editando os mesmos arquivos.
- [ ] Nao vou mexer em arquivo compartilhado sem combinacao.
- [ ] Nao vou conectar Rojo em um place se o painel mostrar o projeto errado.

## Comandos proibidos sem autorizacao explicita

```bash
git reset --hard
git checkout -- .
git clean -fd
rm -rf
```

## Antes de entregar

- [ ] Rodei `./scripts/validate-rojo-project.sh`.
- [ ] Testei com Rojo no Dev Place correto.
- [ ] Rodei `git status`.
- [ ] Rodei `git diff`.
- [ ] Nao fiz commit nem push sem autorizacao.
