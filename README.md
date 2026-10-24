# Modelo LaTeX para trabalhos acadêmicos da UFERSA (não oficial)

Modelo LaTeX para monografias, memoriais, TCCs de especialização,
dissertações e teses da **Universidade Federal Rural do Semi-Árido (UFERSA)**,
baseado nos templates oficiais (Word) da UFERSA e nas normas da ABNT.

> **Aviso:** este é um modelo **não oficial**.
> Ele não é mantido nem endossado pela UFERSA. Em caso de divergência,
> prevalecem os templates e as orientações oficiais da instituição, da
> biblioteca e do seu curso ou programa. Confira sempre a versão mais recente
> dos templates, manuais e tutoriais no site das bibliotecas da UFERSA:
> <https://bibliotecas.ufersa.edu.br/manual-normas-templates-tutoriais/>

## O que o modelo gera

- Capa, folha de rosto, ficha catalográfica (PDF), folha de aprovação,
  dedicatória, agradecimentos, epígrafe, resumo e abstract.
- Listas de figuras, gráficos, mapas, quadros, tabelas, algoritmos,
  códigos-fonte, abreviaturas e siglas e símbolos.
- Sumário, texto, referências (NBR 6023), apêndices, anexos, glossário e
  índice.
- Citações no sistema autor-data conforme a NBR 10520:2023, ex.:
  "Silva (2023)" e "(Silva, 2023)".

## Estrutura

```
documento.tex          Arquivo principal: dados do trabalho e ordem dos elementos
1-pre-textuais/        Resumo, abstract, dedicatória, siglas, ficha (PDF) etc.
2-textuais/            Capítulos
3-pos-textuais/        Referências (.bib), apêndices e glossário
figuras/               Imagens do trabalho
lib/                   Configurações do modelo (não é preciso editar)
Makefile               Compilação local
```

## Como usar

### 1. Preencha os dados do trabalho

Em `documento.tex`, preencha os campos entre colchetes (`[Nome do Autor]`,
`[Título do Trabalho]` etc.) e apague os colchetes. Escolha o tipo de
trabalho:

```latex
\trabalhoacademico{tccgraduacao}  % tccgraduacao, memorial, tccespecializacao,
                                  % dissertacao ou tese
```

Para pós-graduação, ajuste também `\proreitoria`, `\programa`, `\curso`,
`\tituloobtido` e `\linhadepesquisa` (os exemplos estão comentados no
arquivo). Na graduação, autor e título são convertidos para maiúsculas
automaticamente na capa, na folha de rosto e na folha de aprovação.

### 2. Escreva o texto

Edite os arquivos em `1-pre-textuais/`, `2-textuais/` e `3-pos-textuais/`.
Os capítulos de exemplo mostram como inserir figura, quadro, tabela,
equação, citações diretas e indiretas, alíneas, siglas, notas de rodapé e
apêndices. Elementos opcionais podem ser removidos comentando a linha
correspondente em `documento.tex`.

Principais comandos:

| Comando | Resultado |
| --- | --- |
| `\cite{chave}` | (Silva, 2023) |
| `\cite[p. 10]{chave}` | (Silva, 2023, p. 10) |
| `\citeonline{chave}` | Silva (2023) |
| `\begin{citacao} ... \end{citacao}` | Citação direta com mais de três linhas |
| `\gls{SIGLA}` | Sigla (incluída na lista de abreviaturas e siglas) |
| `\Fonte{...}` | "Fonte: ..." abaixo de figuras, quadros e tabelas |

### 3. Ficha catalográfica

Gere a ficha no SIGAA (**Biblioteca > Serviços ao usuário > Solicitar ficha
catalográfica**) ou em <https://sistemas.ufersa.edu.br/fichacatalografica/ficha.php>
e substitua o arquivo `1-pre-textuais/ficha-2.pdf` pelo PDF gerado.
O manual e os tutoriais da biblioteca estão em
<https://bibliotecas.ufersa.edu.br/manual-normas-templates-tutoriais/>.

## Compilação

### Overleaf

1. Baixe este repositório como `.zip` (botão **Code > Download ZIP** no
   GitHub).
2. No Overleaf, clique em **New Project > Upload Project** e envie o `.zip`.
3. Em **Menu**, confira se o compilador é **pdfLaTeX** e se o documento
   principal é `documento.tex`.
4. Clique em **Recompile**. O Overleaf executa BibTeX, glossários e índice
   automaticamente.

### Localmente

Requisitos: uma distribuição TeX completa (TeX Live ou MiKTeX) com os pacotes
`abntex2`, `memoir`, `glossaries`, `pdfpages`, `algorithm2e` e `listings`, além
de Perl (usado pelo `makeglossaries`).

```sh
make          # compila documento.pdf
make clean    # remove os arquivos auxiliares
```

Sem `make`, execute em sequência:

```sh
pdflatex documento
bibtex documento
makeglossaries documento
makeindex documento
pdflatex documento
pdflatex documento
```

No Fedora, por exemplo, o TeX Live completo pode ser instalado com
`sudo dnf install texlive-scheme-full`; no Debian/Ubuntu, com
`sudo apt install texlive-full`.

## Referências normativas

O modelo foi conferido com os
[templates de trabalhos acadêmicos da UFERSA](https://bibliotecas.ufersa.edu.br/manual-normas-templates-tutoriais/) e
com as normas ABNT NBR 14724 (trabalhos acadêmicos), NBR 6023:2018
(referências), NBR 6024:2012 (numeração progressiva), NBR 6027:2012 (sumário),
NBR 6028:2021 (resumo) e NBR 10520:2023 (citações). As normas ABNT são
protegidas por direitos autorais e **não** são distribuídas com este modelo.

## Créditos e licença

Este modelo é uma versão modificada do **modelo de trabalhos acadêmicos da
UFC**, desenvolvido por Ednardo Moreira Rodrigues e Alan Batista de Oliveira,
com revisão de Francisco Edvander Pires Santos, Juliana Soares Lima, Izabel
Lima dos Santos, Kalline Yasmin Soares Feitosa e Eliene Maria Vieira de Moura,
e colaboração de Andrei Bosco Bezerra Torres e Tiago Alves Lima. O modelo da
UFC foi adaptado do [ueceTeX2](https://github.com/thiagodnf/uecetex2), de
Thiago Nascimento (UECE). Todos são baseados no
[abnTeX2](https://www.abntex.net.br/). Os autores originais não prestam
suporte a esta versão.

O código do modelo é distribuído sob a
[LaTeX Project Public License 1.3c](LICENSE) (LPPL), a mesma licença do
trabalho original.

O nome, a sigla e os logotipos da UFERSA (`lib/logo-ufersa.png` e
`lib/brasao-ufersa.png`) pertencem à Universidade Federal Rural do Semi-Árido e
**não** estão cobertos pela LPPL. Eles são incluídos apenas para compor a capa
dos trabalhos acadêmicos da instituição.
