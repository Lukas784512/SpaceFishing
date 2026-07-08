# Space Fishing - Visao do jogo e checklist

## Como usar este checklist

Este arquivo e para voce ler e escolher qual sera o proximo pedido para o Codex. As regras principais do jogo ja estao definidas na visao geral. O checklist abaixo nao e para redefinir o jogo, e sim para montar ele por partes.

## Visao geral do jogo

Space Fishing e um jogo incremental de pescaria espacial para Roblox. O jogador comeca em um planeta grande que funciona como lobby. Esse planeta tem a parte de cima plana, como uma ilha, e a parte de baixo em formato de triangulo invertido cheio de rochas.

No lobby existem duas areas principais: uma area para vender os alienigenas pescados e uma loja para melhorar a nave do jogador. A nave e como um barco espacial: no comeco e simples, mas conforme recebe upgrades fica mais bonita, maior e principalmente mais rapida.

O jogador comeca com uma vara de pescar. Ele vai ate a borda do lobby e tenta pescar Lucky Blocks que passam flutuando pelo espaco. Alguns passam perto da ilha e sao mais faceis de acertar. Outros passam longe, ficam menores na tela e passam mais rapido, entao sao mais dificeis.

Quando o jogador acerta um Lucky Block com o anzol, ele precisa clicar rapidamente para puxar. Se conseguir, aparece uma animacao de abertura do Lucky Block e o jogo revela qual alienigena saiu. O alienigena vem por sorteio de raridade: quanto mais raro, mais valioso.

A sorte aumenta de duas formas. A primeira e pela distancia do Lucky Block: quanto mais longe e dificil, melhor a recompensa possivel. A segunda e pela ilha onde o jogador esta pescando: ilhas mais avancadas dao multiplicadores maiores de sorte. Na ilha 2, por exemplo, o jogador pesca com o dobro de sorte.

Depois de pescar, o jogador vende os alienigenas para ganhar dinheiro. Com esse dinheiro, melhora a nave. Com uma nave mais rapida, ele tenta viajar para ilhas mais distantes, onde consegue mais sorte e recompensas melhores.

Entre uma ilha e outra existe uma travessia perigosa. O jogador pilota a nave pelo espaco enquanto alienigenas inimigos perseguem ele e asteroides aparecem no caminho. Se ele for pego, volta para o lobby e perde os alienigenas que ainda nao vendeu.

O mundo tera 10 ilhas principais. Cada ilha deve ficar mais distante, mais bonita e mais dificil de alcancar. A ultima ilha sera uma super ilha gigante, visivel de longe, servindo como grande objetivo final do jogo.

A estetica deve ser espacial, bonita, colorida e divertida, com inspiracao no clima de Pizza Planet/Toy Story: cores vivas, tecnologia amigavel, formas simples de entender e sensacao de aventura no espaco.

## Checklist de desenvolvimento

### Etapa 01 - Lobby inicial

- [x] Fazer o planeta principal do lobby com topo plano.
- [x] Fazer a parte de baixo do planeta em formato de triangulo invertido rochoso.
- [x] Fazer o ponto onde o jogador nasce.
- [x] Fazer a borda/area onde o jogador vai pescar.
- [x] Fazer a area de vender alienigenas.
- [x] Fazer a area da loja de upgrades da nave.

### Etapa 02 - Visual espacial do lobby

- [x] Colocar ceu espacial bonito.
- [x] Colocar luzes coloridas no estilo Pizza Planet/Toy Story.
- [x] Colocar decoracoes espaciais no lobby.
- [x] Fazer a area de venda parecer uma lojinha clara.
- [x] Fazer a loja da nave parecer uma garagem/oficina espacial.
- [x] Deixar o lobby bonito mesmo antes das outras ilhas existirem.

### Etapa 03 - Vara de pescar

- [ ] Criar a vara de pescar inicial do jogador.
- [ ] Fazer o jogador comecar com a vara.
- [ ] Fazer o jogador conseguir equipar a vara.
- [ ] Fazer o jogador mirar com a vara.
- [ ] Fazer o anzol ser arremessado.
- [ ] Fazer a vara ter um visual facil de reconhecer.

### Etapa 04 - Lucky Blocks voando

- [ ] Criar o modelo dos Lucky Blocks espaciais.
- [ ] Fazer Lucky Blocks passarem voando perto do lobby.
- [ ] Fazer Lucky Blocks passarem voando longe do lobby.
- [ ] Fazer Lucky Blocks distantes passarem mais rapido.
- [ ] Fazer Lucky Blocks distantes parecerem menores e mais dificeis.
- [ ] Fazer os Lucky Blocks continuarem aparecendo com o tempo.

### Etapa 05 - Acerto do anzol

- [ ] Fazer o anzol conseguir acertar um Lucky Block.
- [ ] Fazer o Lucky Block detectar quando foi acertado.
- [ ] Tocar som quando o jogador acerta.
- [ ] Mostrar um feedback visual de acerto.
- [ ] Fazer o jogo saber se o bloco estava perto ou longe.

### Etapa 06 - Puxar o Lucky Block

- [ ] Mostrar na tela que o jogador precisa clicar rapido.
- [ ] Fazer a janela de tempo para puxar o Lucky Block.
- [ ] Fazer o Lucky Block vir ate o jogador quando ele clica a tempo.
- [ ] Fazer o jogador perder o Lucky Block se demorar demais.
- [ ] Fazer a captura parecer satisfatoria.

### Etapa 07 - Abertura do Lucky Block

- [ ] Fazer a tela de abertura do Lucky Block.
- [ ] Fazer uma animacao do bloco abrindo.
- [ ] Fazer suspense antes de revelar o premio.
- [ ] Revelar qual alienigena saiu.
- [ ] Mostrar nome, raridade e valor do alienigena.
- [ ] Usar cor, brilho e som melhor para raridades mais altas.

### Etapa 08 - Alienigenas pescaveis

- [ ] Criar alienigenas comuns.
- [ ] Criar alienigenas incomuns.
- [ ] Criar alienigenas raros.
- [ ] Criar alienigenas epicos.
- [ ] Criar alienigenas lendarios ou secretos.
- [ ] Fazer alienigenas mais raros valerem mais dinheiro.

### Etapa 09 - Sorte da pescaria

- [ ] Fazer Lucky Blocks mais distantes darem mais sorte.
- [ ] Fazer a ilha atual aumentar a sorte do jogador.
- [ ] Fazer a ilha 2 dar o dobro de sorte.
- [ ] Fazer ilhas mais avancadas darem mais sorte que as anteriores.
- [ ] Fazer a sorte influenciar a raridade do alienigena revelado.

### Etapa 10 - Inventario de alienigenas

- [ ] Fazer o jogador guardar os alienigenas pescados.
- [ ] Mostrar um resumo do que o jogador esta carregando.
- [ ] Fazer os alienigenas carregados ficarem pendentes ate serem vendidos.
- [ ] Fazer o jogador perder alienigenas nao vendidos quando for pego na viagem.
- [ ] Deixar claro quando o jogador esta carregando algo valioso.

### Etapa 11 - Venda de alienigenas

- [ ] Fazer a area de venda funcionar.
- [ ] Mostrar quanto dinheiro o jogador vai ganhar.
- [ ] Vender todos os alienigenas carregados.
- [ ] Adicionar o dinheiro ao jogador.
- [ ] Limpar os alienigenas carregados depois da venda.

### Etapa 12 - Dinheiro na tela

- [ ] Mostrar o dinheiro atual do jogador.
- [ ] Atualizar o dinheiro quando ele vende alienigenas.
- [ ] Atualizar o dinheiro quando ele compra upgrades.
- [ ] Mostrar mensagens curtas de ganho e gasto.
- [ ] Fazer o dinheiro ficar facil de ver sem atrapalhar a tela.

### Etapa 13 - Nave inicial

- [ ] Criar a primeira nave do jogador.
- [ ] Fazer a nave parecer um barco espacial.
- [ ] Fazer o jogador conseguir entrar na nave.
- [ ] Fazer o jogador conseguir pilotar a nave.
- [ ] Fazer a nave ter velocidade inicial baixa.
- [ ] Fazer a nave reaparecer perto do jogador quando precisar.

### Etapa 14 - Loja de upgrades da nave

- [ ] Fazer a loja de nave abrir uma interface.
- [ ] Mostrar o nivel atual da nave.
- [ ] Mostrar o preco do proximo upgrade.
- [ ] Comprar upgrade usando dinheiro.
- [ ] Aumentar velocidade da nave quando ela melhora.
- [ ] Melhorar o visual da nave conforme o nivel.

### Etapa 15 - Viagem para a ilha 2

- [ ] Criar a ilha 2.
- [ ] Fazer o caminho espacial entre o lobby e a ilha 2.
- [ ] Fazer o jogador sair do lobby pilotando a nave.
- [ ] Fazer o jogador chegar na ilha 2 se atravessar com sucesso.
- [ ] Fazer a ilha 2 ter area de pesca.
- [ ] Fazer a ilha 2 aplicar o dobro de sorte.

### Etapa 16 - Perigo na viagem

- [ ] Criar alienigenas inimigos perseguindo a nave.
- [ ] Criar asteroides no caminho.
- [ ] Fazer o jogador precisar desviar dos asteroides.
- [ ] Fazer o jogador perder se os inimigos pegarem ele.
- [ ] Fazer o jogador voltar para o lobby quando perder.
- [ ] Fazer ele perder os alienigenas nao vendidos quando perder.

### Etapa 17 - Ilhas 3 ate 9

- [ ] Criar as ilhas 3 ate 9.
- [ ] Fazer cada ilha ficar mais distante que a anterior.
- [ ] Fazer cada ilha ficar mais bonita e detalhada.
- [ ] Fazer cada ilha ter area de pesca.
- [ ] Fazer cada ilha dar mais sorte que a anterior.
- [ ] Fazer a viagem ficar mais dificil a cada ilha.

### Etapa 18 - Super ilha final

- [ ] Criar a ilha 10 como super ilha gigante.
- [ ] Fazer a super ilha ser vista de longe.
- [ ] Fazer ela parecer o grande objetivo do jogo.
- [ ] Fazer a rota ate ela ser a mais dificil.
- [ ] Fazer a pesca nela ter a melhor sorte do jogo.
- [ ] Dar uma sensacao especial quando o jogador chega nela.

### Etapa 19 - Inimigos espaciais melhores

- [ ] Melhorar o visual dos inimigos.
- [ ] Fazer tipos diferentes de inimigos.
- [ ] Fazer inimigos mais rapidos nas rotas avancadas.
- [ ] Fazer avisos visuais quando eles chegam perto.
- [ ] Fazer efeitos quando o jogador e pego.

### Etapa 20 - Asteroides melhores

- [ ] Melhorar o visual dos asteroides.
- [ ] Criar tamanhos diferentes de asteroides.
- [ ] Criar padroes diferentes de obstaculos.
- [ ] Fazer as rotas avancadas terem obstaculos mais perigosos.
- [ ] Fazer efeitos quando a nave bate.

### Etapa 21 - Interface principal

- [ ] Mostrar ilha atual.
- [ ] Mostrar sorte atual.
- [ ] Mostrar alienigenas carregados.
- [ ] Mostrar status da nave.
- [ ] Mostrar mensagens de captura, venda, upgrade e derrota.
- [ ] Deixar a interface clara no computador e no celular.

### Etapa 22 - Sons e efeitos

- [ ] Colocar som na vara de pescar.
- [ ] Colocar som no arremesso do anzol.
- [ ] Colocar som quando acerta o Lucky Block.
- [ ] Colocar som quando puxa o Lucky Block.
- [ ] Colocar som na abertura do Lucky Block.
- [ ] Colocar sons especiais para raridades boas.
- [ ] Colocar sons de nave, inimigos, asteroides, venda e loja.

### Etapa 23 - Melhorar modelos e detalhes

- [ ] Melhorar o visual das ilhas.
- [ ] Melhorar o visual das naves.
- [ ] Melhorar o visual dos Lucky Blocks.
- [ ] Melhorar o visual dos alienigenas pescaveis.
- [ ] Melhorar o visual dos inimigos.
- [ ] Melhorar luzes, particulas, cores e efeitos.

### Etapa 24 - Salvamento do progresso

- [ ] Salvar dinheiro do jogador.
- [ ] Salvar nivel da nave.
- [ ] Salvar maior ilha alcancada.
- [ ] Salvar progresso importante entre partidas.
- [ ] Garantir que o jogador nao perca progresso vendido/comprado.

### Etapa 25 - Tutorial

- [ ] Ensinar onde o jogador deve pescar.
- [ ] Ensinar como mirar e acertar Lucky Blocks.
- [ ] Ensinar que precisa clicar rapido para puxar.
- [ ] Ensinar como vender alienigenas.
- [ ] Ensinar como melhorar a nave.
- [ ] Ensinar que alienigenas nao vendidos podem ser perdidos na viagem.
- [ ] Ensinar que ilhas mais distantes dao mais sorte.

### Etapa 26 - Balanceamento

- [ ] Ajustar dinheiro ganho por cada raridade.
- [ ] Ajustar chance de vir alienigenas raros.
- [ ] Ajustar bonus de sorte por distancia do Lucky Block.
- [ ] Ajustar bonus de sorte de cada ilha.
- [ ] Ajustar preco dos upgrades da nave.
- [ ] Ajustar velocidade da nave por nivel.
- [ ] Ajustar dificuldade dos inimigos.
- [ ] Ajustar dificuldade dos asteroides.

### Etapa 27 - Testes finais

- [ ] Testar pescaria do comeco ao fim.
- [ ] Testar venda de alienigenas.
- [ ] Testar upgrades da nave.
- [ ] Testar viagem entre ilhas.
- [ ] Testar derrota e perda dos alienigenas nao vendidos.
- [ ] Testar chegada ate a super ilha final.
- [ ] Corrigir bugs encontrados.
- [ ] Fazer uma ultima passada de diversao, clareza e visual.
