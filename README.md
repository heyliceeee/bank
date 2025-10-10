# Bank App

Este projeto é uma app Flutter para a gestão bancária, com visual moderno e navegação intuitiva.

## Funcionalidades

- **Visualização de saldo**: Veja seu saldo atual na tela inicial.
- **Cartões**: Lista horizontal de cartões com scroll, cada cartão mostra tipo, valor e número.
- **Finance**: Acesso rápido a bônus, orçamento e análise financeira.
- **Accordion menus**: Expanda para ver detalhes de empréstimos, moedas e metais.
- **Navegação inferior**: Barra de navegação para acessar diferentes áreas do app.
- **Design responsivo**: Layout adaptado para diferentes tamanhos de tela.

## Estrutura

- `lib/screens/home/home.dart`: Tela principal, lógica dos widgets e layout.
- `lib/components/navbar.dart`: Barra de navegação inferior.
- `lib/components/topbarHome.dart`: Barra superior personalizada.
- `lib/global.dart`: Estilos globais e constantes.
- Outras telas: cartões, mensagens, compras, histórico.

## Como rodar

1. Instale o [Flutter](https://docs.flutter.dev/get-started/install).
2. Clone este repositório:
   ```
   git clone https://github.com/heyliceeee/bank.git
   ```
3. Instale as dependências:
   ```
   flutter pub get
   ```
4. Execute o app:
   ```
   flutter run
   ```

## Personalização

- Modifique os estilos em `global.dart`.
- Adicione ou remova cartões e opções financeiras nas funções `_buildCardBox` e `_buildFinanceBox`.
- Expanda funcionalidades criando novas telas em `lib/screens`.

## 🤝 Autora

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/heyliceeee">
        <img src="https://github.com/heyliceeee.png" width="100px;" alt="Foto da Alice Dias no GitHub"/><br>
        <sub><b>Maria Alice Dias</b></sub>
      </a>
    </td>
  </tr>
</table>