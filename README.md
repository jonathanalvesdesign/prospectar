# Prospectar

Ferramenta local para montar listas de prospecção a partir do Google Maps. Você digita o nicho e o bairro, ela busca as empresas, mostra num mapa e num painel, dá uma **nota de prioridade** para cada uma, deixa a **mensagem de abordagem** pronta e exporta tudo para planilha.

Roda no seu computador, não precisa de chave de API e não envia nada sozinha.

---

## Como instalar

### Pelo Claude Code (o jeito mais fácil)

Abra o Claude Code numa pasta qualquer e cole:

```
Clona o repositório https://github.com/jonathanalvesdesign/prospectar, entra na pasta e segue o CLAUDE.md pra instalar e abrir o Prospectar.
```

### Na mão

- **Windows:** rode `instalar.ps1` e, depois, dê dois cliques em **`Abrir Prospectar.cmd`**.
- **Mac e Linux:** `bash instalar.sh` e depois `bash abrir.sh`.

O navegador abre em `http://localhost:8080`. A primeira busca baixa um navegador próprio (uns 150 MB), então demora mais.

O programa escuta **só no seu computador** (`127.0.0.1`). Ninguém na mesma rede consegue abrir o painel.

---

## Como usar

1. **O que você procura?** O nicho: "dentista", "pet shop". Para vários, separe por vírgula.
2. **Onde?** Bairro e cidade. O mapa desenha o raio da busca.
3. **Quantidade:** 20, 60, 120 ou 200+. Quanto mais, mais demora.
4. **Buscar e-mails:** entra no site de cada empresa. Deixa tudo mais lento.
5. Clique em **Buscar empresas** e acompanhe os pontos no mapa.

### Prioridade (0 a 100)

Cada empresa recebe uma nota. A tabela já vem ordenada da mais promissora para a menos.

| O que | Pontos |
|---|---|
| Sem site | 40 |
| Só rede social (Instagram, Facebook…) | 25 |
| Site gratuito ou de construtor (Wix, negocio.site, Blogspot…) | 25 |
| Celular, ou seja, tem WhatsApp | 25 |
| Telefone fixo | 8 |
| Nota no Google 4,5+ / 4,0+ / 3,5+ | 20 / 14 / 7 |
| 30+ avaliações / 10+ avaliações | 15 / 8 |

Passe o mouse sobre a nota para ver o motivo. O filtro **Quentes** mostra só quem tem 70 ou mais. Ajuste os pesos em `score()`, no arquivo `web/static/js/prospectar.js`.

### Mensagem de abordagem

Abra **Mensagem de abordagem** no painel para escrever o seu modelo. Variáveis: `{nome}`, `{bairro}`, `{cidade}`, `{nicho}`, `{problema}` e `{meu_nome}`. O `{problema}` muda sozinho conforme a empresa (sem site, só rede social, ou com site).

- **Abordar** abre o WhatsApp com o texto pronto. **Você confere e aperta enviar.** O Prospectar não envia mensagens sozinho, de propósito: envio automático é o caminho mais rápido para banir o seu número.
- **Copiar msg** serve para quem só tem telefone fixo.

O modelo padrão já inclui uma frase para a pessoa pedir para sair da lista.

### Exportar

- **Baixar planilha:** CSV que abre direto no Excel em português, com Prioridade e Mensagem.

---

## Limites e cuidados

- **Termos do Google.** Coletar dados do Maps de forma automática vai contra os termos de uso do Google. O risco prático é captcha ou bloqueio temporário. Use com moderação.
- **A quantidade é aproximada.** Quem decide quantos resultados vêm é o Google.
- **Quando o Google muda o layout** do Maps, a coleta pode parar até o código ser atualizado.
- **LGPD.** O telefone de empresa no Google é público, mas a abordagem continua sujeita à LGPD: se identifique, diga onde achou o contato e tire da lista quem pedir.

---

## Créditos e licença

O motor de coleta é o [google-maps-scraper](https://github.com/gosom/google-maps-scraper), de Georgios Komninos (gosom), licença MIT. O aviso de copyright dele está em [LICENSE](LICENSE) e o README original em [README-original.md](README-original.md). A base da interface em português vem do MazyOS Scraper, de Vagner Mazzeo.
