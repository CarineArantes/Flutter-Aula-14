# Flutter-Aula-14 (jogo repete)

## Código da API

A API deve conter o seguinte código PHP:

```php
<?php
// Define o cabeçalho da resposta para JSON
header('Content-Type: application/json');

// Gera um número aleatório entre 1 e 6
$randomNumber = rand(1, 6);

// Cria um array para o resultado
$response = array(
    'number' => $randomNumber
);

// Converte o array para JSON e o envia como resposta
echo json_encode($response);
?>
