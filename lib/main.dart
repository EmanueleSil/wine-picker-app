import 'package:flutter/material.dart';

void main() {
  runApp(AgathosApp());
}

class AgathosApp extends StatelessWidget {
  const AgathosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agathos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectionPage(),
      // Define routes to allow navigation
      routes: {
        '/selection': (context) => SelectionPage(),
        '/selection_options': (context) => SelectionOptionsPage(),
        '/results': (context) => ResultsPage(selections: {}), // Placeholder
        '/overlay_two': (context) => OverlayPageTwo(),
      },
    );
  }
}

// Definizione delle categorie e opzioni (ho rimosso 'Vegetariano')
final Map<String, List<String>> categories = {
  'Aperitivo / Antipasto': [
    'Salumi / Formaggi',
    'Carne',
    'Pesce',
    'Generico (stuzzichini/bruschette)',
  ],
  'Primi': [
    'Zuppe / Vegetali',
    'Primi di Pesce',
    'Primi di Carne',
    'Primi Cremosi',
  ],
  'Secondi di Carne': [
    'Rossa o Selvaggina',
    'Bianca',
    'Umido o Brasato',
    'Maiale',
  ],
  'Secondi di Pesce': [
    'Fritto',
    'Umido o al Sugo',
    'Molluschi / Crostacei',
    'Mare / Lago', // Modificato da 'Lago' a 'Mare / Lago'
  ],
  // 'Vegetariano' sarà gestito separatamente
  'Dolci': [
    'Secchi / Biscotti',
    'Alla Frutta',
    'Al Cioccolato',
    'Cremosi',
  ],
  'Fascia Prezzo': [
    '0-25',
    '26-40',
    '41-60',
    '61-100',
    'Oltre 100',
  ],
};

// Mappa delle opzioni alle immagini corrispondenti
final Map<String, String> optionImageMap = {
  'Salumi / Formaggi': 'Salumi-Formaggi.jpg',
  'Carne': 'Antipasto-Carne.jpg',
  'Pesce': 'Antipasto-Pesce.jpg',
  'Generico (stuzzichini/bruschette)': 'Antipasto-Bruschette.jpg',
  'Zuppe / Vegetali': 'Primi-Zuppe.jpg',
  'Primi di Pesce': 'Primi-Pesce.jpg',
  'Primi di Carne': 'Primi-Carne.jpg',
  'Primi Cremosi': 'Primi-Cremosi.jpg',
  'Rossa o Selvaggina': 'Secondi-Rossa.jpg',
  'Bianca': 'Secondi-Bianchi.jpg',
  'Umido o Brasato': 'Secondi-Umido.jpg',
  'Maiale': 'Secondi-Maiale.jpg',
  'Fritto': 'SecondiPesce-Fritto.jpg',
  'Umido o al Sugo': 'SecondiPesce-Umido.jpg',
  'Molluschi / Crostacei': 'SecondiPesce-Crostacei.jpg',
  'Mare / Lago': 'SecondiPesce-LagoMare.jpg',
  'Secchi / Biscotti': 'Dolci-Secchi.jpg',
  'Alla Frutta': 'Dolci-Frutta.jpg',
  'Al Cioccolato': 'Dolci-Cioccolato.jpg',
  'Cremosi': 'Dolci-Cremosi.jpg',
};

// Pagina di Selezione
class SelectionPage extends StatelessWidget {
  const SelectionPage({Key? key}) : super(key: key);

  // Funzione helper per costruire una scheda di opzione
  Widget _buildOptionCard(
    BuildContext context,
    String imagePath,
    String title,
    String subtitle,
    String buttonText,
    VoidCallback onPressed,
  ) {
    return Card(
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Aggiorna questa parte se le risorse non sono accessibili sul web
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Funzioni di navigazione
  void _navigateToSelectionOptions(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionOptionsPage()),
    );
  }

  void _navigateToOverlayTwo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OverlayPageTwo()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'WinePicker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Per iniziare, scegli un percorso',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Scegli tra il Percorso Guidato o la Carta dei Vini.',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context,
              'assets/images/percorso.jpg',
              'Fatti guidare dal nostro Sommelier Virtuale, inizia subito il percorso!',
              'Sommelier Virtuale',
              'Inizia il percorso',
              () {
                // Naviga verso SelectionOptionsPage quando si clicca su "Inizia il percorso"
                _navigateToSelectionOptions(context);
              },
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context,
              'assets/images/carta.jpg',
              'Visualizza un resoconto della carta dei vini, confronta le valutazioni e...',
              'Carta dei vini',
              'Esplora la carta',
              () {
                // Naviga verso OverlayPageTwo quando si clicca su "Esplora la carta"
                _navigateToOverlayTwo(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Seconda Pagina Overlay
class OverlayPageTwo extends StatelessWidget {
  const OverlayPageTwo({Key? key}) : super(key: key);

  // Funzione di navigazione per tornare a SelectionPage
  void _navigateBackToSelection(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/selection'));
  }

  @override
  Widget build(BuildContext context) {
    // Implementa il contenuto di OverlayPageTwo
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text("Carta dei Vini", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigateBackToSelection(context);
          },
          child: const Text('Back to Selection'),
        ),
      ),
    );
  }
}

// Aggiornamento di SelectionOptionsPage con le modifiche richieste
class SelectionOptionsPage extends StatefulWidget {
  const SelectionOptionsPage({Key? key}) : super(key: key);

  @override
  _SelectionOptionsPageState createState() => _SelectionOptionsPageState();
}

class _SelectionOptionsPageState extends State<SelectionOptionsPage> {
  // Mappa per memorizzare le selezioni dell'utente
  Map<String, String> userSelections = {};

  @override
  void initState() {
    super.initState();
    // Inizializziamo 'Vegetariano' a 'No' di default
    userSelections['Vegetariano'] = 'No';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Cosa stai mangiando?',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          ...categories.keys.map((category) {
            List<String> options = categories[category]!;
            return _buildCategorySection(category, options);
          }).toList(),
          _buildVegetarianoToggle(), // Aggiungiamo il toggle per 'Vegetariano'
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitSelections,
        child: const Icon(Icons.check),
        backgroundColor: const Color(0xFFee2b2e),
      ),
    );
  }

  Widget _buildCategorySection(String category, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Intestazione della categoria
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            category,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Griglia delle opzioni
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: options.map((option) {
              return _buildOptionBubble(category, option);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionBubble(String category, String option) {
    bool isSelected = userSelections[category] == option;

    String imageName = optionImageMap[option] ?? 'placeholder.jpg';

    return GestureDetector(
      onTap: () {
        setState(() {
          userSelections[category] = option;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? const Color(0xFFee2b2e) : Colors.grey[800],
          image: DecorationImage(
            image: AssetImage('assets/images/$imageName'),
            fit: BoxFit.cover,
            colorFilter: isSelected
                ? ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken)
                : ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken),
          ),
        ),
        child: Center(
          child: Text(
            option,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Widget per il toggle 'Vegetariano'
  Widget _buildVegetarianoToggle() {
    bool isSelected = userSelections['Vegetariano'] == 'Sì';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Intestazione della categoria
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            'Vegetariano',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Pulsante toggle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  userSelections['Vegetariano'] = isSelected ? 'No' : 'Sì';
                });
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected ? const Color(0xFFee2b2e) : Colors.grey[800],
                  image: DecorationImage(
                    image: AssetImage('assets/images/Vegetariano.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: isSelected
                        ? ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.darken)
                        : ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.darken),
                  ),
                ),
                child: Center(
                  child: Text(
                    isSelected ? 'Sì' : 'No',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _submitSelections() {
    // Imposta 'Null' per le categorie non selezionate
    categories.keys.forEach((category) {
      if (!userSelections.containsKey(category)) {
        userSelections[category] = 'Null';
      }
    });

    // 'Vegetariano' è già impostato

    // Per ora, stampa semplicemente le selezioni
    print('User Selections: $userSelections');
    // Naviga alla pagina dei risultati o esegui la logica di matching
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(selections: userSelections),
      ),
    );
  }
}

// Pagina dei Risultati per visualizzare le selezioni
class ResultsPage extends StatelessWidget {
  final Map<String, String> selections;

  const ResultsPage({Key? key, required this.selections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implementa qui la logica di matching
    return Scaffold(
      appBar: AppBar(
        title: const Text('Risultati'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: selections.entries.map((entry) {
            return ListTile(
              title: Text('${entry.key}: ${entry.value}'),
            );
          }).toList(),
        ),
      ),
    );
  }
}
