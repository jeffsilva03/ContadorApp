Contador Interativo (Flutter)

Este projeto é um aplicativo Flutter simples, porém bem estruturado, que explora conceitos fundamentais de StatefulWidget, gerenciamento de estado, interatividade com botões e atualização dinâmica de interface.  

O app é um contador customizado, com funcionalidades além do incremento padrão:  
- Incrementar
- Decrementar (com decremento duplo)  
- Multiplicar por 2
- Resetar

Além disso, a cor do contador muda automaticamente a cada 5 cliques, proporcionando feedback visual ao usuário.

---
🚀 Tecnologias e Conceitos Utilizados

1. Flutter e Material Design
- `MaterialApp` e `ThemeData` com Material Design.
- Uso de widgets nativos como `Scaffold`, `AppBar`, `Column`, `ElevatedButton`.

2. StatelessWidget vs StatefulWidget
- StatelessWidget (`MeuApp`) → configuração inicial (tema, título e tela inicial).  
- StatefulWidget (`ContadorApp`) → lógica do contador, com atualização dinâmica.

3. Gerenciamento de Estado com `setState()`
- Atualiza variáveis (`numero`, `mensagem`) e reconstrói a UI:  

  setState(() {
    numero = numero + 1;
    _atualizarMensagem();
  });



4. Estrutura de Layout

* `Scaffold` como estrutura principal.
* `Column` + `SizedBox` para organizar elementos.
* `Center` para centralizar a tela.

5. Componentes Interativos

* **`ElevatedButton`** para todas as ações.
* Estilização com `styleFrom` para diferenciar cores e funções.

6. Feedback Visual

* Mudança de cor do número a cada 5 cliques:

  
  color: cores[(numero ~/ 5) % cores.length]
  

* Mensagens motivacionais dinâmicas.
* Indicador mostra quantos cliques faltam para a próxima mudança de cor.

7. Funções Auxiliares

* `_atualizarMensagem()` → centraliza a lógica de mensagens.

---

## 📂 Estrutura do Código


lib/
└── main.dart


* `main()` → ponto de entrada.
* `MeuApp` → widget raiz (Stateless).
* `ContadorApp` → widget principal (Stateful).
* `_ContadorAppState` → lógica (estado, botões, mensagens).

---

Funcionalidades Detalhadas

* Incrementar (+1) → botão azul.
* Decrementar (-2) → botão branco (não permite negativos).
* Multiplicar (×2) → botão verde.
* Resetar (Zerar) → botão vermelho.
* Mudança de cor automática a cada 5 cliques.
* Mensagens dinâmicas.

---


Melhorias Futuras

* 🔄 Adicionar animações nas mudanças de cor.
* 🗂️ Explorar Provider ou Riverpod para gerenciamento de estado.
* 💾 Persistir dados com SharedPreferences.
* 📊 Criar histórico de cliques.

---

Como Executar

Clone o repositório
git clone https://github.com/jeffsilva03/ContadorApp.git
cd ContadorApp

# Instale as dependências
flutter pub get

# Execute o app
flutter run


