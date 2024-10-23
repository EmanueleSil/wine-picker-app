// index.js

require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { Pool } = require('pg');

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Configurazione del pool di connessione al database
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false, // Necessario per connettersi a Heroku Postgres
  },
});

// Endpoint per ottenere i vini in base alle selezioni dell'utente
app.post('/api/get-wines', async (req, res) => {
  const selections = req.body;

  // Mappare le selezioni per gestire eventuali valori 'Null'
  const params = [
    selections['Aperitivo / Antipasto'] || 'Null',
    selections['Primi'] || 'Null',
    selections['Secondi di Carne'] || 'Null',
    selections['Secondi di Pesce'] || 'Null',
    selections['Vegetariano'] || 'No',
    selections['Dolci'] || 'Null',
    selections['Fascia Prezzo'] || 'Null',
  ];

  // Costruisci la query SQL
  const query = `
    SELECT * FROM combinations
    WHERE
      (aperitivo_antipasto = $1 OR $1 = 'Null')
      AND (primi = $2 OR $2 = 'Null')
      AND (secondi_di_carne = $3 OR $3 = 'Null')
      AND (secondi_di_pesce = $4 OR $4 = 'Null')
      AND (vegetariano = $5)
      AND (dolci = $6 OR $6 = 'Null')
      AND (fascia_prezzo = $7 OR $7 = 'Null')
    LIMIT 2;
  `;

  try {
    const result = await pool.query(query, params);
    res.json(result.rows);
  } catch (error) {
    console.error('Errore durante l\'esecuzione della query:', error);
    res.status(500).json({ error: 'Errore interno del server' });
  }
});

// Avvia il server
app.listen(port, () => {
  console.log(`Server in esecuzione sulla porta ${port}`);
});
