# Projet d’intégration de données avec Python, MySQL Workbench et Power BI

## Description du projet

Ce projet a pour objectif de mettre en place un processus d’intégration de données à l’aide de Python, puis de stocker les données dans une base MySQL gérée avec MySQL Workbench. Les données intégrées sont ensuite exploitées dans Power BI afin de créer des visualisations et faciliter l’analyse.

Le projet suit une logique ETL, c’est-à-dire extraction, transformation et chargement des données. Les traitements sont réalisés avec Python, tandis que MySQL sert à organiser les différentes couches de stockage des données. Power BI est utilisé à la fin du processus pour représenter les résultats sous forme de tableaux de bord.

## Objectifs

Les principaux objectifs du projet sont les suivants :

- automatiser l’intégration des données avec Python ;
- charger les données dans MySQL Workbench ;
- structurer les données dans différentes couches, notamment SOURCE, DSA, ODS et éventuellement DW ;
- conserver l’historique des changements dans la couche ODS ;
- préparer les données pour l’analyse et la visualisation ;
- créer des graphiques et tableaux de bord avec Power BI.

## Architecture générale du projet

Le processus global peut être résumé de la manière suivante :

```text
Fichiers de données
        |
        v
Traitement Python
        |
        v
Base SOURCE
        |
        v
Base DSA
        |
        v
Base ODS
        |
        v
Base DWH
        |
        v
Power BI
```

La base SOURCE contient les données intégrées initialement.  
La base DSA sert de zone intermédiaire pour recevoir les données issues de la source.  
La base ODS permet de conserver un historique des données et de suivre leurs évolutions.  
Power BI permet de visualiser les données finales.

## Technologies utilisées

- Python
- Pandas
- SQLAlchemy
- MySQL
- MySQL Workbench
- Jupyter Notebook
- Power BI

## Fonctionnalités principales

### Connexion aux bases de données

Le projet utilise une fonction de connexion permettant d’établir automatiquement la connexion avec les différentes bases MySQL.

### Chargement des données vers la base SOURCE

Les données sont d’abord intégrées dans la base SOURCE. Cette étape permet de centraliser les données brutes avant de les transférer vers les autres couches.

### Transfert des données de SOURCE vers DSA

Les données de la base SOURCE sont transférées vers la base DSA.  
Ce chargement respecte l’ordre des tables afin d’éviter les erreurs liées aux contraintes d’intégrité, notamment les clés étrangères. Avant chaque chargement, les tables cibles sont vidées pour éviter les doublons.

### Transfert des données de DSA vers ODS

Les données de la DSA sont ensuite comparées avec celles déjà présentes dans l’ODS.  
Si une donnée est nouvelle ou si ses valeurs ont changé, elle est ajoutée dans l’ODS. Cette logique permet de conserver un historique des changements.

### Visualisation avec Power BI

Une fois les données disponibles dans MySQL, Power BI est connecté à la base afin de créer des visualisations. Les tableaux de bord permettent d’analyser les données de manière plus claire et interactive.

## Structure possible du projet

```text
project/
├── DVF_Partie1.pbix
├── README.md
├── create_database.sql
├── dvf_bi.csv
├── extraire.ipynb
└── flux_final_v2.ipynb
```

## Installation

### 1. Cloner le projet

```bash
git clone <url-du-projet>
cd <nom-du-projet>
```

### 2. Créer un environnement virtuel

```bash
python -m venv venv
```

Activer l’environnement virtuel :

```bash
# Windows
venv\Scripts\activate

# macOS / Linux
source venv/bin/activate
```

### 3. Installer les dépendances

```bash
pip install -r requirements.txt
```

Exemple de dépendances possibles :

```text
pandas
sqlalchemy
pymysql
mysql-connector-python
jupyter
python-dotenv
```

### 4. Configurer la connexion MySQL

Avant d’exécuter le projet, il faut vérifier que MySQL est lancé et que les bases nécessaires existent dans MySQL Workbench.

Exemple de configuration :

```text
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=your_password
MYSQL_PORT=3306
```

## Exécution du projet

L’exécution peut se faire depuis un notebook Jupyter ou depuis un script Python.

```bash
jupyter notebook
```

Puis lancer le notebook principal :

```text
flux_final_v2.ipynb
```

Les étapes principales à exécuter sont :

1. connexion aux bases MySQL ;
2. intégration des données dans la base SOURCE ;
3. transfert des données de SOURCE vers DSA ;
4. transfert des données de DSA vers ODS ;
5. vérification du chargement ;
6. connexion de Power BI à MySQL ;
7. création des visualisations.

## Connexion à Power BI

Pour connecter Power BI à MySQL :

1. ouvrir Power BI Desktop ;
2. choisir Obtenir les données ;
3. sélectionner MySQL database ;
4. renseigner le serveur et la base de données ;
5. importer les tables nécessaires ;
6. créer les relations et les visualisations.

## Résultat attendu

À la fin du projet, les données sont intégrées, organisées et historisées dans MySQL. Elles peuvent ensuite être exploitées dans Power BI pour produire des tableaux de bord et faciliter l’analyse.

## Auteure

Projet réalisé par Lam Lê Hoàng Ngọc dans le cadre d’un travail d’intégration et de visualisation de données.
