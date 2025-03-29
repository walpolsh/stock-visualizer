#!/bin/bash

# Define file paths and namespaces as key-value pairs
declare -a paths_and_namespaces=(
  "src/Domain/Model/Stock.php:App\\Domain\\Model"
  "src/Domain/Model/User.php:App\\Domain\\Model"
  "src/Domain/Model/Portfolio.php:App\\Domain\\Model"
  "src/Domain/Service/StockCalculator.php:App\\Domain\\Service"
  "src/Domain/Exception/InvalidStockPriceException.php:App\\Domain\\Exception"
  "src/Application/Command/AddStockDataCommand.php:App\\Application\\Command"
  "src/Application/Command/Handler/AddStockDataHandler.php:App\\Application\\Command\\Handler"
  "src/Application/Query/GetStockDetailsQuery.php:App\\Application\\Query"
  "src/Application/Query/Handler/GetStockDetailsHandler.php:App\\Application\\Query\\Handler"
  "src/Infrastructure/Doctrine/Entity/StockEntity.php:App\\Infrastructure\\Doctrine\\Entity"
  "src/Infrastructure/Doctrine/Repository/DoctrineStockRepository.php:App\\Infrastructure\\Doctrine\\Repository"
  "src/Infrastructure/Persistence/StockRepositoryInterface.php:App\\Infrastructure\\Persistence"
  "src/Infrastructure/GraphQL/Resolver/StockQueryResolver.php:App\\Infrastructure\\GraphQL\\Resolver"
  "src/Infrastructure/GraphQL/Resolver/StockMutationResolver.php:App\\Infrastructure\\GraphQL\\Resolver"
  "src/UI/Controller/HomeController.php:App\\UI\\Controller"
)

# Loop through each pair and generate file
for item in "${paths_and_namespaces[@]}"
do
  IFS=":" read -r file namespace <<< "$item"
  class=$(basename "$file" .php)
  mkdir -p "$(dirname "$file")"

  cat <<EOF > "$file"
<?php

namespace $namespace;

class $class
{
    // TODO: Implement $class
}
EOF

  echo "✅ Created $file"
done