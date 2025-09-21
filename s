import java.util.*;

public class SorteadorNumeros {
    private static Scanner scanner = new Scanner(System.in);
    private static Random random = new Random();
    
    // Lista de prêmios disponíveis
    private static String[] premios = {
        "R$ 1.000,00 em dinheiro",
        "iPhone 15 Pro Max",
        "PlayStation 5",
        "Notebook Dell Inspiron",
        "Smart TV 55\" Samsung",
        "Fone de Ouvido AirPods Pro",
        "Vale-compras R$ 500,00",
        "Xbox Series X",
        "Tablet iPad",
        "Smartwatch Apple Watch"
    };
    
    public static void main(String[] args) {
        System.out.println("🎉 BEM-VINDO AO SORTEADOR DE NÚMEROS! 🎉");
        System.out.println("=========================================");
        
        boolean continuar = true;
        
        while (continuar) {
            mostrarMenu();
            int opcao = obterOpcao();
            
            switch (opcao) {
                case 1:
                    sorteioSimples();
                    break;
                case 2:
                    sorteioPersonalizado();
                    break;
                case 3:
                    sorteioMultiplos();
                    break;
                case 4:
                    System.out.println("\n👋 Obrigado por participar! Até logo!");
                    continuar = false;
                    break;
                default:
                    System.out.println("❌ Opção inválida! Tente novamente.");
            }
        }
        
        scanner.close();
    }
    
    private static void mostrarMenu() {
        System.out.println("\n📋 ESCOLHA UMA OPÇÃO:");
        System.out.println("1 - Sorteio Simples (1 a 100)");
        System.out.println("2 - Sorteio Personalizado");
        System.out.println("3 - Sorteio Múltiplos Números");
        System.out.println("4 - Sair");
        System.out.print("\nDigite sua opção: ");
    }
    
    private static int obterOpcao() {
        try {
            return scanner.nextInt();
        } catch (InputMismatchException e) {
            scanner.nextLine(); // Limpa buffer
            return -1;
        }
    }
    
    private static void sorteioSimples() {
        System.out.println("\n🎲 SORTEIO SIMPLES (1 a 100)");
        System.out.println("================================");
        
        System.out.print("Digite seu palpite (1-100): ");
        int palpite = obterNumero(1, 100);
        
        if (palpite == -1) return;
        
        System.out.println("\n🔄 Sorteando...");
        aguardar(2000);
        
        int numeroSorteado = random.nextInt(100) + 1;
        
        System.out.println("🎯 Número sorteado: " + numeroSorteado);
        System.out.println("🤔 Seu palpite: " + palpite);
        
        if (palpite == numeroSorteado) {
            String premio = premios[random.nextInt(premios.length)];
            mostrarVitoria(premio);
        } else {
            mostrarDerrota(Math.abs(palpite - numeroSorteado));
        }
    }
    
    private static void sorteioPersonalizado() {
        System.out.println("\n🎲 SORTEIO PERSONALIZADO");
        System.out.println("=========================");
        
        System.out.print("Digite o número mínimo: ");
        int min = scanner.nextInt();
        System.out.print("Digite o número máximo: ");
        int max = scanner.nextInt();
        
        if (min >= max) {
            System.out.println("❌ Valores inválidos! O mínimo deve ser menor que o máximo.");
            return;
        }
        
        System.out.print("Digite seu palpite (" + min + "-" + max + "): ");
        int palpite = obterNumero(min, max);
        
        if (palpite == -1) return;
        
        System.out.println("\n🔄 Sorteando...");
        aguardar(2000);
        
        int numeroSorteado = random.nextInt(max - min + 1) + min;
        
        System.out.println("🎯 Número sorteado: " + numeroSorteado);
        System.out.println("🤔 Seu palpite: " + palpite);
        
        if (palpite == numeroSorteado) {
            String premio = premios[random.nextInt(premios.length)];
            mostrarVitoria(premio);
        } else {
            mostrarDerrota(Math.abs(palpite - numeroSorteado));
        }
    }
    
    private static void sorteioMultiplos() {
        System.out.println("\n🎲 SORTEIO MÚLTIPLOS NÚMEROS");
        System.out.println("==============================");
        
        System.out.print("Quantos números você quer sortear? ");
        int quantidade = scanner.nextInt();
        
        if (quantidade <= 0 || quantidade > 10) {
            System.out.println("❌ Quantidade inválida! Digite entre 1 e 10.");
            return;
        }
        
        System.out.print("Digite o número mínimo: ");
        int min = scanner.nextInt();
        System.out.print("Digite o número máximo: ");
        int max = scanner.nextInt();
        
        if (min >= max) {
            System.out.println("❌ Valores inválidos!");
            return;
        }
        
        System.out.println("\n🔄 Sorteando " + quantidade + " números...");
        aguardar(2000);
        
        Set<Integer> numerosSorteados = new TreeSet<>();
        
        while (numerosSorteados.size() < quantidade) {
            int numero = random.nextInt(max - min + 1) + min;
            numerosSorteados.add(numero);
        }
        
        System.out.println("🎯 Números sorteados: " + numerosSorteados);
        
        // Sorteia um prêmio aleatório
        String premio = premios[random.nextInt(premios.length)];
        System.out.println("\n🎁 PRÊMIO ESPECIAL PARA VOCÊ:");
        System.out.println("🏆 " + premio);
        mostrarAnimacaoVitoria();
    }
    
    private static int obterNumero(int min, int max) {
        try {
            int numero = scanner.nextInt();
            if (numero < min || numero > max) {
                System.out.println("❌ Número fora do intervalo!");
                return -1;
            }
            return numero;
        } catch (InputMismatchException e) {
            scanner.nextLine();
            System.out.println("❌ Digite um número válido!");
            return -1;
        }
    }
    
    private static void mostrarVitoria(String premio) {
        System.out.println("\n🎉🎉🎉 PARABÉNS! VOCÊ GANHOU! 🎉🎉🎉");
        System.out.println("=======================================");
        System.out.println("🏆 SEU PRÊMIO: " + premio);
        mostrarAnimacaoVitoria();
        
        System.out.println("\n📧 Entre em contato conosco para retirar seu prêmio:");
        System.out.println("📞 Telefone: (11) 99999-9999");
        System.out.println("📮 Email: premios@sorteador.com");
    }
    
    private static void mostrarDerrota(int diferenca) {
        System.out.println("\n😔 Que pena! Você não acertou desta vez.");
        
        if (diferenca == 1) {
            System.out.println("🔥 Uau! Você chegou muito perto! Diferença de apenas 1 número!");
        } else if (diferenca <= 5) {
            System.out.println("👍 Muito bom! Você chegou bem perto! Diferença de " + diferenca + " números.");
        } else if (diferenca <= 10) {
            System.out.println("😊 Não foi desta vez, mas você chegou perto! Diferença de " + diferenca + " números.");
        } else {
            System.out.println("💪 Continue tentando! A sorte pode estar esperando você!");
        }
        
        System.out.println("\n🍀 PRÊMIO DE CONSOLAÇÃO: Vale-desconto 10% em nossa loja!");
    }
    
    private static void mostrarAnimacaoVitoria() {
        String[] frames = {"🎊", "🎉", "⭐", "🎊", "🎉", "⭐"};
        
        for (int i = 0; i < 3; i++) {
            for (String frame : frames) {
                System.out.print("\r" + frame + " VOCÊ É O GRANDE VENCEDOR! " + frame);
                aguardar(200);
            }
        }
        System.out.println();
    }
    
    private static void aguardar(int milissegundos) {
        try {
            Thread.sleep(milissegundos);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
