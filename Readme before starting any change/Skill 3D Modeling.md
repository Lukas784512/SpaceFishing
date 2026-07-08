# Skill: Criação de Modelos 3D Low Poly para Roblox com Parts

## Objetivo da skill

Esta skill deve ser usada sempre que for necessário criar, revisar, melhorar ou gerar por código um modelo 3D dentro do Roblox Studio usando Parts, MeshParts simples, WedgeParts, CornerWedgeParts, Cylinders, Spheres/Balls e outros objetos nativos do Roblox.

O objetivo principal é criar modelos 3D com aparência profissional, coerente e bonita, parecendo modelos low poly feitos manualmente para jogos Roblox, e não modelos gerados de forma desorganizada por IA.

A estética-alvo é parecida com modelos usados em jogos Roblox de estilo cartunesco, blocky, low poly, plástico e altamente legível, como jogos de jardinagem, criaturas, personagens meme/brainrot, frutas, objetos colecionáveis e props estilizados.

Quando o projeto mencionar "textura Grow Garden", "textura Brainrot", "textura do Brogarden" ou "aquela textura", interpretar como a textura visual de peças Roblox/Lego com studs ou almofadas quadradas em relevo sobre a superfície: quadradinhos repetidos, levemente elevados, com sombra em um lado e brilho claro no outro, como aparece em pets, frutas, blocos e terrenos desses jogos. Nao interpretar isso apenas como material `SmoothPlastic` ou como cor viva lisa.

O modelo final deve parecer:

- Low poly.
- Colorido.
- Limpo.
- Coerente.
- Bem proporcionado.
- Feito com intenção artística.
- Compatível com Roblox.
- Otimizado para jogo.
- Sem partes bugadas, tortas, voando, atravessando de forma estranha ou desalinhadas.

---

## Quando usar esta skill

Use esta skill sempre que o usuário pedir qualquer coisa parecida com:

- Criar um modelo 3D no Roblox.
- Criar um objeto com Parts.
- Criar um personagem low poly.
- Criar uma fruta, animal, criatura, item, ferramenta, decoração, pet, monstro, NPC ou prop.
- Melhorar um modelo Roblox gerado por código.
- Fazer um modelo parecer mais profissional.
- Fazer algo no estilo Grow a Garden, Brainrot, low poly, Lego, blocky ou cartunesco.
- Verificar se um modelo está coerente.
- Corrigir partes flutuando, clipping, z-fighting, proporções ruins ou detalhes bugados.

---

## Princípios obrigatórios

### 1. Silhueta primeiro

Antes de adicionar detalhes pequenos, o modelo precisa ter uma silhueta clara.

A silhueta deve permitir que o jogador entenda o objeto mesmo de longe.

Exemplos:

- Uma maçã precisa parecer uma maçã antes de receber brilho, folha, talo ou detalhes.
- Um cachorro precisa parecer um cachorro antes de receber olhos, coleira ou textura.
- Um monstro precisa ter cabeça, corpo, membros e expressão visualmente compreensíveis antes de receber acessórios.

Nunca comece o modelo pelos detalhes. Primeiro construa as massas principais.

Ordem correta:

1. Massa principal.
2. Proporções gerais.
3. Partes secundárias.
4. Detalhes de identificação.
5. Detalhes decorativos.
6. Validação final.

---

### 2. Coerência anatômica e estrutural

O modelo precisa fazer sentido fisicamente.

Sempre verificar:

- Orelhas conectadas à cabeça.
- Olhos posicionados na frente correta do rosto.
- Boca abaixo dos olhos.
- Pernas conectadas ao corpo.
- Braços conectados aos ombros ou laterais.
- Folhas conectadas ao talo.
- Talo conectado à fruta.
- Acessórios presos em alguma parte lógica.
- Nenhuma peça importante flutuando sem motivo.
- Nenhuma peça entrando em outra de forma visivelmente bugada.
- Nenhuma peça atravessando olhos, boca, nariz, orelhas ou outros detalhes importantes.

Partes podem ter uma pequena interseção escondida para parecerem conectadas, mas nunca devem atravessar visivelmente outras partes de forma estranha.

---

### 3. Evitar clipping, z-fighting e bugs visuais

Antes de considerar o modelo pronto, verificar:

- Não existem duas faces exatamente no mesmo plano.
- Não existem peças duplicadas ocupando o mesmo lugar.
- Não existem olhos afundando demais na cabeça.
- Não existe boca atravessando os olhos.
- Não existem acessórios cortando o corpo.
- Não existem partes internas aparecendo para fora.
- Não existem peças finas tremendo visualmente por z-fighting.
- Não existem superfícies coplanares competindo entre si.

Para detalhes de rosto, botões, manchas ou placas:

- Posicionar a peça levemente acima da superfície.
- Usar deslocamento pequeno, normalmente entre `0.01` e `0.05` studs.
- Evitar que a peça fique exatamente no mesmo plano da superfície base.
- Se o detalhe for colocado sobre uma superfície curva, ajustar rotação e posição para seguir a direção visual da superfície.

---

### 4. Estética low poly Roblox

O modelo deve ter aparência estilizada, não realista.

Características desejadas:

- Formas simples, mas bem combinadas.
- Volumes exagerados de forma controlada.
- Cores vivas e legíveis.
- Material plástico ou smooth plastic.
- Pouca textura realista.
- Detalhes feitos por geometria simples.
- Visual de brinquedo, peça colecionável ou item de jogo.
- Proporções ligeiramente fofas, caricatas ou chamativas.
- Leitura clara em tamanho pequeno.

Evitar:

- Realismo excessivo.
- Texturas sujas demais.
- Cores lavadas sem contraste.
- Excesso de microdetalhes.
- Objetos com aparência aleatória.
- Partes minúsculas sem função visual.
- Modelos que parecem montes de Parts jogadas.

---

### 5. Textura e material

Preferir materiais nativos do Roblox.

Materiais recomendados:

- `Enum.Material.SmoothPlastic`
- `Enum.Material.Plastic`
- `Enum.Material.Neon` apenas para detalhes especiais, olhos brilhantes ou efeitos mágicos.
- `Enum.Material.Wood` apenas quando o objeto realmente for madeira.
- `Enum.Material.Grass` apenas em bases naturais ou grama.
- `Enum.Material.Metal` apenas em detalhes mecânicos ou ferramentas.

Para o estilo plástico tipo brinquedo/Lego:

- Usar SmoothPlastic ou Plastic.
- Usar cores limpas.
- Adicionar brilhos simples com pequenas partes claras.
- Adicionar sombras falsas com partes ligeiramente mais escuras.
- Usar detalhes geométricos em vez de imagens realistas.
- Usar studs, círculos pequenos, placas simples e almofadas quadradas em relevo quando fizer sentido.

### 5.1 Textura Grow Garden / Brainrot obrigatoria

Quando o usuario pedir estilo Grow Garden, Brainrot, Brogarden, toy Roblox, textura Lego ou mostrar referencia parecida com fruta/pet/bloco coberto por quadradinhos em relevo, aplicar a textura de studs/almofadas como parte do acabamento visual.

Essa textura significa:

- Base colorida e brilhante em `SmoothPlastic` ou `Plastic`.
- Padroes repetidos de quadrados, retangulos curtos, studs ou almofadas pequenas em relevo.
- Cada relevo deve ficar levemente acima da superficie, normalmente `0.03` a `0.12` studs.
- Cada relevo deve ter sombra falsa, usando uma peça um pouco mais escura atras/abaixo ou deslocada.
- Cada relevo deve ter brilho falso, usando uma peça menor clara/branca/translucida ou uma faixa clara no canto superior.
- O padrao deve seguir a orientacao da face onde esta aplicado.
- Em superficies grandes, repetir o padrao em grade com espacamento regular.
- Em superficies curvas ou inclinadas, usar menos relevos, maiores e bem posicionados, para nao parecer poluido.

Construcao recomendada de cada quadradinho em relevo:

1. Criar a peça principal do relevo com a mesma cor da base ou um tom levemente mais claro.
2. Criar uma sombra pequena atras/embaixo com cor 15% a 35% mais escura.
3. Criar um highlight fino no topo/lado superior com branco, creme ou cor clara com transparencia.
4. Deixar tudo `CanCollide = false`, exceto se o relevo tambem fizer parte da jogabilidade.

Aplicar essa textura principalmente em:

- frutas grandes;
- Lucky Blocks;
- pets e criaturas blocky;
- partes grandes de naves;
- pisos e plataformas de lobby;
- paredes de lojas;
- caixas, maquinas, paineis e props colecionaveis.

Nao aplicar como ruido aleatorio. O padrao deve parecer intencional, alinhado e feito por artista. Se a superficie principal ficar lisa demais e parecer apenas uma Part padrao do Roblox, o modelo ainda nao esta no estilo pedido.

Nunca usar textura realista pesada se o objetivo for modelo low poly Roblox.

---

## Processo obrigatório de criação

### Etapa 1: Interpretar o objeto

Antes de criar qualquer Part, definir:

- O que o modelo representa.
- Qual é a vista principal.
- Qual é a silhueta esperada.
- Quais são os elementos obrigatórios.
- Quais detalhes tornam o objeto reconhecível.
- Qual escala faz sentido no Roblox.

Exemplo para maçã:

- Massa principal: corpo arredondado vermelho.
- Elementos obrigatórios: formato de maçã, talo, folha.
- Detalhes úteis: brilho, pequena depressão superior, variação de vermelho.
- Estilo: fruta colecionável low poly.

Exemplo para criatura:

- Massa principal: cabeça e corpo.
- Elementos obrigatórios: olhos, boca, membros.
- Detalhes úteis: orelhas, dentes, manchas, acessórios.
- Estilo: criatura fofinha/cartunesca ou meme.

---

### Etapa 2: Criar massas principais

Construir primeiro as maiores formas do modelo.

Use:

- Ball/Sphere para frutas, cabeças e corpos arredondados.
- Block para bases, troncos, caixas, acessórios e partes retas.
- Cylinder para talos, braços simples, canos, rodas, moedas e olhos circulares.
- WedgePart para folhas, focinhos, pontas, cabelos, asas, bicos e formas angulares.
- CornerWedgePart para detalhes diagonais e volumes low poly.

As massas principais precisam estar bem alinhadas e centralizadas.

Sempre usar um eixo principal para o modelo:

- Frente do modelo: normalmente eixo `-Z`.
- Costas: eixo `+Z`.
- Direita/esquerda: eixo `X`.
- Cima/baixo: eixo `Y`.

Manter simetria quando o objeto for simétrico.

---

### Etapa 3: Criar formas secundárias

Depois da massa principal, adicionar partes secundárias.

Exemplos:

- Talo de fruta.
- Folha.
- Orelhas.
- Braços.
- Pernas.
- Sapatos.
- Chifres.
- Asas.
- Chapéu.
- Mochila.
- Ferramentas.
- Cauda.

Toda parte secundária deve estar conectada visualmente ao corpo principal.

Nunca deixar uma parte secundária voando.

Se a peça deve parecer presa, ela precisa:

- Tocar a superfície principal.
- Entrar muito levemente na superfície principal.
- Ter alguma peça de conexão.
- Ter sombra/contato visual que indique encaixe.

---

### Etapa 4: Criar detalhes de identidade

Adicionar somente detalhes que ajudam o jogador a entender o que o modelo é.

Exemplos:

Para maçã:

- Talo.
- Folha.
- Brilho.
- Depressão superior.
- Tom mais escuro na parte inferior.

Para animal:

- Olhos.
- Focinho.
- Boca.
- Orelhas.
- Patas.
- Cauda.
- Manchas ou listras.

Para monstro:

- Olhos expressivos.
- Dentes.
- Chifres.
- Garras.
- Expressão facial.
- Proporção caricata.

Para item mágico:

- Cristais.
- Brilho.
- Aura.
- Símbolo.
- Pedestal.

Detalhes devem ser legíveis, não aleatórios.

---

### Etapa 5: Aplicar cores

As cores devem seguir uma paleta clara.

Regras:

- Usar uma cor principal dominante.
- Usar uma cor secundária para contraste.
- Usar uma cor escura para sombras ou contornos.
- Usar uma cor clara para brilhos.
- Evitar muitas cores competindo.
- Evitar tons muito próximos sem intenção.
- Evitar cores realistas demais se o estilo for cartunesco.

Para modelos colecionáveis, usar contraste forte e leitura imediata.

Exemplo de maçã:

- Corpo: vermelho vivo.
- Sombra inferior: vermelho escuro.
- Brilho: rosa claro ou branco suave.
- Talo: marrom.
- Folha: verde vivo.

---

### Etapa 6: Adicionar acabamento low poly

O acabamento deve fazer o modelo parecer intencionalmente modelado.

Técnicas:

- Usar formas levemente angulares.
- Evitar excesso de suavização realista.
- Usar blocos, wedges e cylinders com proporções simples.
- Criar detalhes grandes o suficiente para serem vistos.
- Usar contornos por contraste de cor quando necessário.
- Criar pequenas variações de volume para não parecer um bloco cru.
- Manter o modelo limpo e organizado.

O modelo precisa ser simples, mas não pobre.

Low poly não significa sem detalhe. Significa detalhe bem escolhido.

---

## Regras específicas para rosto

Ao criar rosto, seguir sempre esta ordem:

1. Definir a frente do rosto.
2. Marcar a linha central vertical.
3. Posicionar olhos simetricamente.
4. Posicionar boca abaixo dos olhos.
5. Posicionar nariz/focinho se existir.
6. Verificar expressão.
7. Verificar se nada atravessa o rosto.

Olhos:

- Devem estar na mesma altura, exceto se a assimetria for intencional.
- Devem estar voltados para frente.
- Não podem entrar demais dentro da cabeça.
- Não podem ficar flutuando longe do rosto.
- Devem ter tamanho coerente com o estilo.
- Para estilo fofo, olhos maiores funcionam melhor.
- Para estilo meme/brainrot, olhos podem ser exagerados, mas ainda precisam estar alinhados.

Boca:

- Deve ficar abaixo dos olhos.
- Não pode atravessar olhos, nariz ou focinho.
- Deve seguir a curvatura/posição do rosto.
- Pode ser feita com uma peça fina escura, uma curva aproximada por pequenos blocos ou uma peça simples.

Dentes:

- Devem sair da boca, não do meio do rosto.
- Devem estar alinhados.
- Não devem atravessar os olhos.
- Devem ser grandes o suficiente para aparecer, mas não destruir a expressão.

---

## Regras específicas para frutas, plantas e comida

Modelos de frutas, plantas e comidas devem ser reconhecíveis de imediato.

Para frutas:

- Criar corpo principal com volume claro.
- Adicionar talo quando apropriado.
- Adicionar folha quando apropriado.
- Usar brilho simples.
- Usar variações de cor para dar profundidade.
- Não exagerar em detalhes pequenos.

Para plantas:

- Tronco ou caule precisa conectar as folhas.
- Folhas não podem flutuar.
- Folhas devem ter variação de tamanho e ângulo.
- A planta deve ter base clara.
- Evitar folhas atravessando umas às outras de forma caótica.

Para comidas:

- Criar forma principal simples.
- Adicionar camadas visíveis.
- Usar cores apetitosas e claras.
- Evitar textura realista demais.
- Usar detalhes geométricos para cobertura, recheio, sementes, gotas ou brilho.

---

## Regras específicas para personagens, pets e criaturas

Personagens, pets e criaturas precisam ter personalidade.

Obrigatório verificar:

- Cabeça proporcional ao corpo.
- Corpo com volume principal claro.
- Olhos legíveis.
- Expressão clara.
- Membros conectados.
- Silhueta reconhecível.
- Acessórios presos corretamente.
- Nenhuma parte flutuando sem intenção.
- Nenhum detalhe atravessando outro detalhe.

Para estilo fofo:

- Cabeça maior.
- Olhos maiores.
- Corpo compacto.
- Membros curtos.
- Cores vivas.
- Formas arredondadas.

Para estilo meme/brainrot:

- Proporção pode ser absurda, mas precisa ser controlada.
- A ideia pode ser estranha, mas a construção não pode parecer bugada.
- O exagero precisa ser intencional.
- A silhueta precisa continuar clara.
- A expressão deve ser forte e legível.

---

## Organização do modelo no Roblox

Todo modelo deve ser organizado.

Regras:

- Criar um `Model` principal com nome claro.
- Definir um `PrimaryPart`.
- Agrupar partes por função quando necessário.
- Nomear peças importantes.
- Evitar nomes genéricos demais como `Part`, `Part2`, `Part3`.
- Usar nomes como `Body`, `Head`, `LeftEye`, `RightEye`, `Stem`, `Leaf`, `Mouth`, `Highlight`, `Shadow`, `Base`.
- Definir `Anchored = true` para modelos decorativos.
- Definir `CanCollide = false` para detalhes pequenos.
- Definir `CanCollide = true` apenas para base ou corpo se o objeto precisar de colisão.
- Definir `Massless = true` para detalhes decorativos quando aplicável.

---

## Boas práticas de geração por código

Ao gerar modelos por script no Roblox/Luau:

- Criar funções auxiliares para criar Parts.
- Centralizar posições usando um ponto de origem.
- Evitar valores aleatórios sem controle.
- Usar variáveis para escala.
- Usar comentários para explicar grupos de partes.
- Criar o modelo de forma previsível.
- Não espalhar Parts soltas no Workspace.
- Colocar tudo dentro do Model.
- Usar `model:PivotTo()` quando precisar posicionar o conjunto.
- Usar `Model:GetBoundingBox()` para conferir tamanho geral.

Exemplo de estrutura recomendada:

```lua
local model = Instance.new("Model")
model.Name = "LowPolyApple"

local function createPart(name, size, cframe, color, material, shape)
    local part = Instance.new("Part")
    part.Name = name
    part.Size = size
    part.CFrame = cframe
    part.Color = color
    part.Material = material or Enum.Material.SmoothPlastic
    part.Anchored = true
    part.CanCollide = false

    if shape then
        part.Shape = shape
    end

    part.Parent = model
    return part
end
```

Para formas arredondadas:

```lua
part.Shape = Enum.PartType.Ball
```

Para cilindros:

```lua
part.Shape = Enum.PartType.Cylinder
```

Para peças angulares:

```lua
local wedge = Instance.new("WedgePart")
```

Sempre ajustar `CFrame`, `Size` e rotação com cuidado.

---

## Checklist obrigatório antes de finalizar

Antes de entregar qualquer modelo, revisar todos os itens abaixo.

### Checklist de forma geral

- O objeto é reconhecível?
- A silhueta está clara?
- O modelo representa corretamente o que foi pedido?
- As proporções fazem sentido?
- O modelo parece intencional e não aleatório?
- O modelo está bonito visto de frente?
- O modelo está bonito visto de lado?
- O modelo está bonito visto de cima?
- O modelo está bonito visto de perto?
- O modelo está legível visto de longe?

### Checklist de conexão

- Nenhuma parte importante está flutuando?
- Orelhas, braços, pernas, folhas, talos e acessórios estão conectados?
- As conexões parecem naturais?
- Existe contato visual entre as partes conectadas?
- Nenhuma peça parece perdida no espaço?

### Checklist de clipping

- Nenhuma peça atravessa outra de forma feia?
- Nenhum olho está entrando na boca?
- Nenhuma boca está atravessando os olhos?
- Nenhum acessório está cortando o corpo de forma estranha?
- Nenhuma parte interna está aparecendo para fora?
- Não há superfícies duplicadas no mesmo plano?
- Não há z-fighting?

### Checklist de rosto

- Os olhos estão alinhados?
- Os olhos estão na frente correta?
- A boca está abaixo dos olhos?
- A expressão está clara?
- O rosto está simétrico quando deveria ser?
- O rosto está intencionalmente assimétrico quando esse for o objetivo?
- Nenhuma peça facial está torta sem intenção?

### Checklist de estilo

- O modelo parece low poly?
- O modelo parece Roblox?
- O modelo parece plástico/cartunesco?
- Se o pedido menciona Grow Garden/Brainrot/Brogarden, existe textura de studs ou almofadas quadradas em relevo?
- Os relevos tem sombra e brilho falsos, em vez de serem apenas quadrados lisos colados?
- O padrao de textura segue a face do objeto e parece intencional?
- As cores estão bonitas?
- A paleta está coerente?
- Há detalhes suficientes?
- Não há excesso de detalhes pequenos?
- O modelo não parece gerado de forma aleatória?

### Checklist técnico

- Todas as partes estão dentro do Model?
- O Model tem nome claro?
- As Parts principais têm nomes claros?
- Existe PrimaryPart quando necessário?
- As partes decorativas estão com `CanCollide = false`?
- O modelo está ancorado quando for decorativo?
- A escala está adequada para Roblox?
- A quantidade de partes é razoável?
- O modelo não está pesado demais sem necessidade?

---

## Regra de revisão automática

Depois de criar o modelo, fazer uma revisão mental como se estivesse olhando o objeto no Roblox Studio.

Perguntar:

1. “Isso realmente parece o objeto pedido?”
2. “Alguma parte parece estar voando?”
3. “Alguma parte parece ter sido colocada no lugar errado?”
4. “Existe alguma colisão visual estranha?”
5. “O modelo parece bonito e vendável dentro de um jogo Roblox?”
6. “Um jogador entenderia o que é isso em menos de 1 segundo?”
7. “O modelo parece feito por um artista low poly ou parece improvisado por IA?”
8. “Se o usuário pediu textura Grow Garden/Brainrot, a superfície tem relevos repetidos com sombra e brilho?”

Se qualquer resposta indicar problema, corrigir antes de finalizar.

---

## Padrão de qualidade esperado

Nunca entregar um modelo apenas funcional.

O modelo deve ser:

- Jogável.
- Bonito.
- Coerente.
- Limpo.
- Estilizado.
- Reconhecível.
- Organizado.
- Sem bugs visuais.
- Com aparência de asset real de jogo Roblox.

A criação deve buscar qualidade de asset final, não apenas uma representação básica.

---

## Exemplo de raciocínio para uma maçã

Pedido: criar uma maçã low poly.

Raciocínio correto:

1. Criar corpo principal arredondado vermelho.
2. Ajustar proporção para parecer maçã, não bola genérica.
3. Criar leve depressão superior visual usando uma parte mais escura ou volume complementar.
4. Adicionar talo marrom no topo, conectado ao corpo.
5. Adicionar folha verde presa ao talo.
6. Adicionar brilho claro na lateral superior.
7. Adicionar sombra suave na parte inferior.
8. Verificar se talo e folha não estão voando.
9. Verificar se o brilho não está afundado ou atravessando a fruta.
10. Verificar se a maçã é reconhecível de longe.

Resultado esperado: uma maçã estilizada, colorida, low poly e limpa, não apenas uma esfera vermelha com um cilindro em cima.

---

## Exemplo de raciocínio para uma criatura

Pedido: criar uma criatura brainrot/cartunesca.

Raciocínio correto:

1. Definir a ideia central da criatura.
2. Criar corpo principal com silhueta forte.
3. Criar cabeça proporcional ou exagerada de forma intencional.
4. Adicionar olhos grandes e alinhados.
5. Adicionar boca expressiva.
6. Adicionar membros conectados ao corpo.
7. Adicionar acessórios ou detalhes absurdos, mas coerentes.
8. Garantir que o exagero pareça escolha artística, não bug.
9. Verificar se nenhuma peça está flutuando.
10. Verificar se o modelo é engraçado/estranho, mas ainda bonito e bem construído.

Resultado esperado: uma criatura estilizada, memorável e coerente, não um amontoado de peças aleatórias.

---

## Restrições importantes

Não fazer:

- Modelos com partes desconectadas sem motivo.
- Modelos com olhos tortos sem intenção.
- Modelos com boca atravessando olho.
- Modelos com orelha flutuando.
- Modelos com acessórios enterrados no corpo.
- Modelos com cores sem harmonia.
- Modelos com detalhes pequenos demais para aparecer.
- Modelos com excesso de Parts sem necessidade.
- Modelos que parecem bugados.
- Modelos que parecem gerados por IA sem revisão artística.
- Modelos que não representam claramente o pedido.

Sempre priorizar qualidade visual e coerência.

---

## Saída esperada ao criar um modelo

Ao entregar código ou instruções de criação do modelo, incluir:

1. Nome do modelo.
2. Descrição rápida do conceito visual.
3. Script ou instruções de construção.
4. Explicação breve das principais partes.
5. Checklist final de qualidade.
6. Observação se algum ponto precisar ser ajustado manualmente no Roblox Studio.

O código precisa gerar um modelo organizado, com Parts nomeadas e agrupadas, pronto para ser revisado no Roblox Studio.

---

## Critério final

Um modelo só está pronto quando parece um asset low poly Roblox criado de propósito, com boa leitura visual, detalhes suficientes e sem erros óbvios de construção.

Se o modelo parecer simples demais, adicionar detalhes úteis.

Se parecer poluído demais, remover detalhes desnecessários.

Se parecer bugado, corrigir geometria, alinhamento e conexões.

Se parecer genérico, reforçar os elementos que tornam o objeto reconhecível.

A prioridade máxima é: coerência visual, beleza, legibilidade e ausência de bugs.
