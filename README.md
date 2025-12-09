# Layoffs Dataset – Data Cleaning & Exploratory Data Analysis (MySQL)

## Descrizione del progetto

Questo repository contiene un progetto SQL completo per la **pulizia** e l’**analisi esplorativa** di un dataset di licenziamenti aziendali (prevalentemente nel settore tech/startup).

L’obiettivo è:

- partire da un file CSV grezzo (`layoffs.csv`);
- caricare i dati in MySQL;
- applicare una pipeline di **data cleaning** strutturata;
- eseguire una serie di query di **Exploratory Data Analysis (EDA)** per capire:
  - quali aziende hanno licenziato di più,
  - quali settori e Paesi sono stati maggiormente colpiti,
  - l’evoluzione temporale dei licenziamenti.

---

## Struttura del repository

- `layoffs.csv`  
  Dataset originale in formato CSV.

- `Layoffs Data Cleaning.sql`  
  Script SQL che:
  - crea tabelle di staging,
  - rimuove i duplicati,
  - standardizza stringhe e date,
  - gestisce i valori null,
  - produce la tabella pulita `layoffs_staging2`. 

- `Exploratory Data Analysis.sql`  
  Script SQL di analisi esplorativa che esegue aggregazioni, ranking e calcoli di serie temporali sulla tabella pulita `layoffs_staging2`. 

---

## Schema dei dati

La tabella di lavoro principale dopo il data cleaning è `layoffs_staging2`, con le seguenti colonne:

| Colonna                | Tipo (logico) | Descrizione                                                         |
|------------------------|---------------|---------------------------------------------------------------------|
| `company`              | TEXT          | Nome dell’azienda                                                   |
| `location`             | TEXT          | Località (città / area)                                            |
| `industry`             | TEXT          | Settore di appartenenza dell’azienda                               |
| `total_laid_off`       | INT           | Numero totale di dipendenti licenziati                             |
| `percentage_laid_off`  | NUM / TEXT    | Percentuale di dipendenti licenziati (0–1, es. 1 = 100%)           |
| `date`                 | DATE          | Data dell’annuncio/onda di licenziamento                           |
| `stage`                | TEXT          | Stage dell’azienda (es. Startup, Post-IPO, ecc.)                   |
| `country`              | TEXT          | Paese (normalizzato, es. “United States”)                          |
| `funds_raised_millions`| INT           | Fondi raccolti (in milioni di USD)                                 |
