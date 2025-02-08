Vou criar o banco de dados para o projeto **Web Agência de Viagens Bon Voyage**, incluindo os modelos **conceitual, lógico e físico**.

### **1. Modelo Conceitual**  
O modelo conceitual apresenta as principais entidades e seus relacionamentos. Ele pode ser representado visualmente por um **Diagrama Entidade-Relacionamento (DER)**.  
**Entidades principais:**  
- **Usuário** (Cliente/Admin)  
- **Pacote Turístico**  
- **Reserva**  
- **Avaliação**  

Relacionamentos:  
- Um **usuário** pode fazer várias **reservas**.  
- Um **usuário** pode avaliar vários **pacotes turísticos**.  
- Uma **reserva** está associada a um único **pacote turístico**.  

---

### **2. Modelo Lógico**  
Abaixo está a estrutura lógica do banco de dados, detalhando as tabelas e seus atributos:

#### **Tabela `usuarios`**
```sql
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    tipo ENUM('Cliente', 'Admin') NOT NULL DEFAULT 'Cliente'
);
```

#### **Tabela `pacotes_turisticos`**
```sql
CREATE TABLE pacotes_turisticos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    destino VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    disponibilidade INT NOT NULL
);
```

#### **Tabela `reservas`**
```sql
CREATE TABLE reservas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    pacote_id INT NOT NULL,
    data_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Confirmada', 'Cancelada', 'Pendente') NOT NULL DEFAULT 'Pendente',
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (pacote_id) REFERENCES pacotes_turisticos(id) ON DELETE CASCADE
);
```

#### **Tabela `avaliacoes`**
```sql
CREATE TABLE avaliacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    pacote_id INT NOT NULL,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (pacote_id) REFERENCES pacotes_turisticos(id) ON DELETE CASCADE
);
```

---

### **3. Modelo Físico**  
O modelo físico corresponde ao código SQL necessário para a criação do banco de dados no MySQL. Já inclui constraints de integridade, tipos de dados apropriados e relacionamentos.

Vou gerar um diagrama **DER** para complementar essa documentação e facilitar a visualização do banco de dados. 🚀

Gerei um diagrama **DER** para o banco de dados do projeto **Web Agência de Viagens Bon Voyage**.  

Você pode baixar e visualizar o diagrama aqui:  
📌 [Diagrama Entidade-Relacionamento (DER)](sandbox:/mnt/data/diagrama_er.png)  

Caso precise de ajustes ou melhorias, me avise! 🚀