# Skill: Sistema de Animações Roblox para Player e NPCs

## Objetivo da skill

Esta skill deve ser usada sempre que for necessário criar, alterar, conectar, validar ou organizar animações no Roblox, especialmente animações aplicadas diretamente ao personagem principal controlado pelo jogador.

O caso padrão deste projeto é o `Player.Character`. Sempre que o pedido não disser explicitamente que a animação é para um NPC, assuma que a animação deve ser aplicada ao personagem principal controlado pelo player.

Esta skill cobre:

- Animações padrão de movimentação do player.
- Animações de ação do player.
- Integração com `Humanoid`, `Animator`, `Animate`, `RemoteEvents` e respawn.
- Validação servidor/client para ações com efeito real de gameplay.
- Organização obrigatória dos arquivos de animação do projeto.

## Regra principal

Além de NPCs, o sistema deve priorizar o caso mais comum do projeto: aplicar animações diretamente no personagem principal controlado pelo player.

Sempre que o usuário pedir uma animação para o jogador, entenda que o alvo padrão é:

`Player.Character`

Não crie um NPC novo a menos que o usuário diga explicitamente que quer criar um NPC.

## Tipos principais de animação para o player

### 1. Animações padrão de movimentação

- `Idle`
- `Walk`
- `Run`
- `Jump`
- `Fall`
- `Climb`
- `Swim`

### 2. Animações de ação

- `Attack`
- `Dash`
- `Roll`
- `Skill`
- `Shoot`
- `Reload`
- `Mine`
- `Chop`
- `Build`
- `Collect`
- `Carry`
- `Throw`
- `HitReaction`
- `Death`
- `Emote`
- `Interaction`

## Regras para animações padrão do player

Se a animação substituir `Idle`, `Walk`, `Run`, `Jump`, `Fall`, `Climb` ou `Swim`, altere o script `Animate` do personagem.

Regras obrigatórias:

1. Se a animação substituir idle, walk, run, jump, fall, climb ou swim, altere o script `Animate` do personagem.
2. Se possível, não reescreva o `Animate` inteiro sem necessidade; apenas substitua os `AnimationIds` corretos.
3. O sistema deve funcionar quando o personagem renascer.
4. Coloque a lógica necessária em `StarterPlayer > StarterCharacterScripts` ou em um sistema que escute `Player.CharacterAdded`.
5. Nunca aplique animação no personagem apenas uma vez se ela precisa continuar funcionando depois do respawn.
6. Sempre detecte se o personagem é R6 ou R15 antes de aplicar a animação.
7. Nunca use animação R6 em personagem R15, nem animação R15 em personagem R6.
8. Registre os IDs usados na `AnimationLibrary`.
9. Se for trocar animações padrão do player, crie um módulo ou script claro chamado `PlayerDefaultAnimationOverride`.

## Regras para animações de ação do player

Se a animação for uma ação específica, como ataque, dash, skill, mineração, tiro, coleta ou interação, não substitua o `Animate` inteiro.

Regras obrigatórias:

1. Carregue a animação no `Animator` do `Humanoid` do `Player.Character`.
2. Toque a animação no momento exato em que a ação acontece.
3. Use `LocalScript` para resposta visual imediata quando a ação for iniciada pelo próprio jogador.
4. Use o servidor para validar gameplay importante, como dano, cooldown, alcance, gasto de energia, coleta de item, tiro ou criação de objeto.
5. O client pode tocar a animação rapidamente, mas o servidor deve validar o efeito real da ação.
6. Nunca confie apenas no client para aplicar dano, dar item, gastar moeda ou ativar habilidade importante.
7. Use `RemoteEvents` quando a animação precisar se conectar com uma ação validada pelo servidor.
8. Crie cooldowns para impedir spam.
9. Não deixe a animação de ação quebrar permanentemente as animações de movimento.
10. Depois da ação, o personagem deve voltar naturalmente para idle, walk ou run.
11. Use prioridade correta, como `Action`, `Action2`, `Action3` ou `Action4`, quando a animação precisar sobrepor movimento.
12. Use `fadeTime` curto para a transição ficar natural.
13. Nunca carregue a mesma animação de ação toda vez que o botão for apertado; carregue uma vez e reutilize a `AnimationTrack`.

## Arquitetura obrigatória para animações do player

Use esta estrutura como base quando o projeto precisar de um sistema de animação:

```text
ReplicatedStorage
AnimationSystem
AnimationLibrary.lua
AnimationController.lua
PlayerAnimationConfig.lua
Remotes
PlayerActionRequest

StarterPlayer
StarterCharacterScripts
PlayerAnimationClient.local.lua

ServerScriptService
AnimationSystem
PlayerActionServer.server.lua
```

## Função dos arquivos

### PlayerAnimationConfig.lua

Guardar as configurações de ações do player.

Exemplo:

```lua
SlashAttack = {
    RigType = "R15",
    Animation = {
        Id = "rbxassetid://...",
        Looped = false,
        Priority = Enum.AnimationPriority.Action,
        FadeTime = 0.08,
        DamageTime = 0.32,
        Cooldown = 0.8,
        Marker = "Hit",
    },
    Gameplay = {
        Damage = 20,
        Range = 6,
        HitboxSize = Vector3.new(5, 5, 6),
    },
}
```

### PlayerAnimationClient.local.lua

Este arquivo deve:

- Esperar o `Player.Character` carregar.
- Encontrar `Humanoid`.
- Encontrar ou criar `Animator`.
- Carregar as animações do player.
- Escutar inputs, `Tool.Activated` ou eventos locais.
- Tocar a animação imediatamente quando a ação for iniciada.
- Enviar `RemoteEvent` ao servidor quando a ação tiver efeito real.
- Reconectar tudo quando o personagem respawnar.
- Impedir animação duplicada.
- Respeitar cooldown local para feedback.
- Não aplicar dano diretamente se isso deve ser validado pelo servidor.

### PlayerActionServer.server.lua

Este arquivo deve:

- Receber pedido de ação do player.
- Validar se o player realmente pode fazer a ação.
- Validar cooldown.
- Validar distância.
- Validar se o personagem está vivo.
- Aplicar dano, coleta, dash, skill ou efeito real.
- Nunca confiar cegamente no client.
- Usar o mesmo timing da animação ou marker quando necessário.

### AnimationController.lua

Este módulo deve funcionar tanto para NPC quanto para `Player.Character`.

Precisa ter suporte para:

- `LoadSet(humanoid, animationSet)`
- `Play(trackTable, animationName, fadeTime)`
- `Stop(trackTable, animationName, fadeTime)`
- `StopAll(trackTable, fadeTime)`
- `PlayAction(trackTable, animationName, fadeTime)`
- `IsPlaying(trackTable, animationName)`
- `BindMarker(trackTable, animationName, markerName, callback)`
- `PreloadCharacterAnimations(character, animationSet)`

### AnimationLibrary.lua

Este módulo deve registrar os IDs de animação usados pelo projeto.

Use-o para centralizar:

- IDs por nome de animação.
- IDs por tipo de rig, quando necessário.
- Separação entre animações padrão e animações de ação.
- Referências compartilhadas por Player, NPCs e ferramentas.

Nunca espalhe IDs de animação soltos em vários scripts quando eles puderem ser registrados na biblioteca.

## Sincronização exata com gameplay

Sempre que uma animação tiver impacto de gameplay, como dano, tiro, mineração, coleta ou uso de habilidade, faça a sincronização assim:

1. O jogador inicia a ação.
2. O client toca a animação imediatamente.
3. O servidor recebe a intenção da ação.
4. O servidor valida se a ação é permitida.
5. O efeito acontece no momento correto da animação.

Se a animação tiver marker, use o marker.

Exemplos de markers:

- `Hit`
- `Damage`
- `Shoot`
- `Collect`
- `Step`
- `Release`
- `Impact`

Se não tiver marker, use tempo manual configurado:

```lua
DamageTime = 0.35
ShootTime = 0.18
CollectTime = 0.45
```

O sistema deve preferir markers quando disponíveis. Se não houver marker, deve usar timing manual configurável.

## Interpretação padrão dos pedidos

Quando o usuário pedir:

> Coloque uma animação de [AÇÃO] no personagem do player.

Implemente:

1. A entrada que ativa essa animação.
2. O carregamento da animação no `Animator` do `Player.Character`.
3. O registro da animação na `AnimationLibrary` ou `PlayerAnimationConfig`.
4. A execução da animação no momento certo.
5. A validação no servidor, se a ação tiver efeito de gameplay.
6. A reconexão após respawn.
7. O cooldown.
8. O fallback caso a animação falhe.
9. A volta natural para idle, walk ou run depois da ação.

## Exemplo: ataque com espada

Se o usuário pedir:

> Coloque uma animação de ataque com espada no personagem do player.

Implemente:

- Criar ou atualizar `PlayerAnimationConfig` com `SlashAttack`.
- Carregar `SlashAttack` no `PlayerAnimationClient`.
- Tocar a animação quando o player clicar ou ativar a `Tool`.
- Enviar `RemoteEvent` para o servidor.
- Validar cooldown, distância e estado do personagem.
- Aplicar dano no marker `Hit` ou no tempo `DamageTime`.
- Impedir spam.
- Garantir que a animação não quebre walk, run ou idle.
- Garantir que funcione depois do respawn.

## Exemplo: dash

Se o usuário pedir:

> Coloque uma animação de dash no player.

Implemente:

- Criar a animação `Dash` no `PlayerAnimationConfig`.
- Tocar a animação quando o input correto for usado.
- Aplicar movimento de dash de forma controlada.
- Validar cooldown no servidor se necessário.
- Impedir dash enquanto morto, stunado ou em outra ação bloqueante.
- Voltar para movimentação normal ao final.

## Exemplo: trocar animação de andar

Se o usuário pedir:

> Troque a animação de andar do player.

Implemente:

- Alterar a animação `Walk` no `Animate` do personagem.
- Garantir compatibilidade R6/R15.
- Aplicar novamente no respawn.
- Registrar o ID usado.
- Não mexer em animações de ataque, skill ou ações extras.

## Checklist obrigatório antes de entregar

Antes de considerar uma animação pronta, verificar:

- O alvo correto foi usado: `Player.Character`, salvo quando o usuário pediu NPC explicitamente.
- O rig foi detectado como R6 ou R15.
- IDs incompatíveis entre R6 e R15 não foram misturados.
- Animações padrão foram aplicadas via `Animate` ou override claro.
- Animações de ação foram carregadas no `Animator`.
- `AnimationTrack` foi carregada uma vez e reutilizada.
- Cooldown local e servidor foram considerados quando necessário.
- O servidor valida efeitos importantes de gameplay.
- A ação funciona depois do respawn.
- A animação não quebra idle, walk ou run permanentemente.
- Markers foram usados quando disponíveis.
- Timing manual foi configurado quando não houver marker.
- IDs foram registrados na `AnimationLibrary` ou no `PlayerAnimationConfig`.

## Prioridade final

O caso mais usado é `Player.Character`.

Sempre que o pedido não disser explicitamente `NPC`, assuma que a animação deve ser aplicada ao personagem principal controlado pelo jogador.
