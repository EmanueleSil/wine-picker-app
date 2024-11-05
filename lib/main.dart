import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const AgathosApp());
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
      home: const SelectionPage(),
      // Define routes to allow navigation
      routes: {
        '/selection': (context) => const SelectionPage(),
        '/selection_options': (context) => const SelectionOptionsPage(),
        '/wine_list': (context) => const WineListPage(),
      },
    );
  }
}

// Definizione delle categorie e opzioni
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
    'Primo Generico',
  ],
  'Secondi di Carne': [
    'Rossa o Selvaggina',
    'Bianca',
    'Umido o Brasato',
    'Maiale',
    'Secondo di Carne - Generico',
  ],
  'Secondi di Pesce': [
    'Fritto',
    'Umido o al Sugo',
    'Molluschi / Crostacei',
    'Mare / Lago',
    'Secondo di Pesce - Generico',
  ],
  // 'Vegetariano' sarà gestito separatamente
  'Dolci': [
    'Secchi / Biscotti',
    'Alla Frutta',
    'Al Cioccolato',
    'Cremosi',
  ],
  // 'Fascia Prezzo' sarà aggiunta separatamente
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
  'Primo Generico': 'PrimoGenerico.jpg',
  'Rossa o Selvaggina': 'Secondi-Rossa.jpg',
  'Bianca': 'Secondi-Bianchi.jpg',
  'Umido o Brasato': 'Secondi-Umido.jpg',
  'Maiale': 'Secondi-Maiale.jpg',
  'Secondo di Carne - Generico': 'SecondoGenericoCarne.jpg',
  'Fritto': 'SecondiPesce-Fritto.jpg',
  'Umido o al Sugo': 'SecondiPesce-Umido.jpg',
  'Molluschi / Crostacei': 'SecondiPesce-Crostacei.jpg',
  'Mare / Lago': 'SecondiPesce-LagoMare.jpg',
  'Secondo di Pesce - Generico': 'SecondoGenericoPesce.jpg',
  'Secchi / Biscotti': 'Dolci-Secchi.jpg',
  'Alla Frutta': 'Dolci-Frutta.jpg',
  'Al Cioccolato': 'Dolci-Cioccolato.jpg',
  'Cremosi': 'Dolci-Cremosi.jpg',
  // Aggiungi altre immagini se necessario
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
          // Immagine
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
      MaterialPageRoute(builder: (context) => const SelectionOptionsPage()),
    );
  }

  void _navigateToWineListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WineListPage()),
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
              'Fatti guidare dal nostro Sommelier Virtuale, '
                  'inizia subito il percorso!',
              'Sommelier Virtuale',
              'Inizia il percorso',
              () {
                _navigateToSelectionOptions(context);
              },
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context,
              'assets/images/carta.jpg',
              'Visualizza un resoconto della carta dei vini, '
                  'confronta le valutazioni e...',
              'Carta dei vini',
              'Esplora la carta',
              () {
                _navigateToWineListPage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Pagina di Selezione delle Opzioni
class SelectionOptionsPage extends StatefulWidget {
  const SelectionOptionsPage({Key? key}) : super(key: key);

  @override
  _SelectionOptionsPageState createState() => _SelectionOptionsPageState();
}

class _SelectionOptionsPageState extends State<SelectionOptionsPage> {
  // Mappa per memorizzare le selezioni dell'utente
  Map<String, String> userSelections = {};

  // Ordine delle categorie per l'interfaccia
  final List<String> categoryOrder = [
    'Aperitivo / Antipasto',
    'Primi',
    'Secondi di Carne',
    'Secondi di Pesce',
    'Vegetariano',
    // 'Biologico', // Rimosso dalla visualizzazione
    'Dolci',
    'Fascia Prezzo',
  ];

  @override
  void initState() {
    super.initState();
    // Inizializziamo 'Vegetariano' e 'Biologico' a 'No' di default
    userSelections['Vegetariano'] = 'No';
    userSelections['Biologico'] =
        'No'; // Manteniamo 'Biologico' come 'No' di default
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
        children: categoryOrder.map((category) {
          if (category == 'Vegetariano') {
            return _buildVegetarianoToggle();
          } else if (category == 'Fascia Prezzo') {
            // Costruisci la sezione per 'Fascia Prezzo'
            List<String> options = [
              '0-25',
              '26-40',
              '41-60',
              '61-100',
              'Oltre 100',
            ];
            return _buildCategorySection(category, options);
          } else {
            List<String> options = categories[category]!;
            return _buildCategorySection(category, options);
          }
        }).toList(),
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
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: options.map((option) {
              return SizedBox(
                width: 100,
                height: 100,
                child: _buildOptionBubble(category, option),
              );
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
          // Seleziona l'opzione
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
    bool isSelected = userSelections['Vegetariano'] == 'Si';

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
                  userSelections['Vegetariano'] = isSelected ? 'No' : 'Si';
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
                    isSelected ? 'Si' : 'No',
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

    // Verifica che 'Fascia Prezzo' sia stata selezionata
    if (userSelections['Fascia Prezzo'] == null ||
        userSelections['Fascia Prezzo'] == 'Null') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Per favore, seleziona una fascia di prezzo.')),
      );
      return;
    }

    // 'Vegetariano' e 'Biologico' sono già impostati

    // Naviga alla pagina di caricamento
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingPage(selections: userSelections),
      ),
    );
  }
}

// Pagina di Caricamento
class LoadingPage extends StatefulWidget {
  final Map<String, String> selections;

  const LoadingPage({Key? key, required this.selections}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double progress = 0.0;
  Timer? timer;
  List<String> wineNames = [];
  String displayedWine = '';
  Random random = Random();
  // Variabile per memorizzare i risultati pre-caricati
  late ResultsPage resultsPage;

  @override
  void initState() {
    super.initState();
    loadWineNames();
    startLoading();
    // Pre-carica la pagina dei risultati
    resultsPage = ResultsPage(selections: widget.selections);
    resultsPage.loadData(); // Chiama la funzione per caricare i dati
  }

  void loadWineNames() async {
    String wineData =
        await rootBundle.loadString('assets/data/winedetail.json');
    List<dynamic> wineList = json.decode(wineData);
    setState(() {
      wineNames = wineList
          .map((wine) => '${wine['Nome del Vino']} ${wine['Annata'] ?? ''}')
          .toList();
    });
  }

  void startLoading() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      setState(() {
        progress += 0.02;
        if (progress >= 1.0) {
          progress = 1.0;
          timer?.cancel();
        }
        // Aggiorna il vino visualizzato
        if (wineNames.isNotEmpty) {
          displayedWine = wineNames[random.nextInt(wineNames.length)];
        }
      });
    });
  }

  void navigateToResults() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => resultsPage,
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calcola la percentuale
    int percentage = (progress * 100).toInt();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Titolo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'WinePicker',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Progress Bar e Percentuale
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Testo "Quasi pronto!" e percentuale
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Quasi pronto!',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        '$percentage%',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Barra di progresso
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: const Color(0xFFEB2930),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Testo principale
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Stiamo selezionando il miglior vino per te',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            // Vino visualizzato
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome del vino
                    Text(
                      displayedWine,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Pulsante "Risultati"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: progress >= 1.0
                  ? ElevatedButton(
                      onPressed: navigateToResults,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEB2930),
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Risultati',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

// Pagina dei Risultati con i dati locali
class ResultsPage extends StatefulWidget {
  final Map<String, String> selections;

  const ResultsPage({Key? key, required this.selections}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();

  // Aggiungiamo una funzione per caricare i dati dall'esterno
  Future<void> loadData() async {
    await _ResultsPageState().loadLocalData();
  }
}

class _ResultsPageState extends State<ResultsPage> {
  List<dynamic> combinations = [];
  List<dynamic> matchingCombinations = [];
  Map<String, dynamic> wineDetails = {};
  bool isLoading = true;

  // Funzione per normalizzare le stringhe
  String normalize(String value) {
    return value.trim().toLowerCase();
  }

  // Stato per la categoria selezionata
  String selectedCategory = 'Vino Rosso';

  // Lista delle categorie disponibili
  final List<String> categoriesWine = ['Vino Rosso', 'Vino Bianco', 'Spumante'];

  // Mappa per raggruppare i vini per categoria
  Map<String, Map<String, List<String>>> winesByCategory = {
    'Vino Rosso': {'VERO': [], 'FALSO': []},
    'Vino Bianco': {'VERO': [], 'FALSO': []},
    'Spumante': {'VERO': [], 'FALSO': []},
  };

  @override
  void initState() {
    super.initState();
    loadLocalData();
  }

  Future<void> loadLocalData() async {
    try {
      // Carica il file combinations.json
      String data =
          await rootBundle.loadString('assets/data/combinations.json');
      combinations = json.decode(data);

      // Carica il file winedetail.json
      String wineData =
          await rootBundle.loadString('assets/data/winedetail.json');
      List<dynamic> wineList = json.decode(wineData);

      // Crea una mappa per un accesso più rapido ai dettagli dei vini
      wineDetails = {for (var wine in wineList) wine['Nome del Vino']: wine};

      // Filtra le combinazioni
      filterCombinations();

      // Raggruppa i vini per categoria
      groupWinesByCategory();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Errore durante il caricamento dei dati locali: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterCombinations() {
    Map<String, String> selections = widget.selections;

    matchingCombinations = combinations.where((combination) {
      bool matches = true;

      // Verifica ogni categoria che può essere 'Null'
      categories.keys.forEach((category) {
        String userSelection = selections[category] ?? 'Null';
        String combinationValue = combination[category] ?? 'Null';

        if (normalize(userSelection) != 'null') {
          if (normalize(combinationValue) != normalize(userSelection)) {
            matches = false;
          }
        } else {
          if (normalize(combinationValue) != 'null') {
            matches = false;
          }
        }
      });

      // Verifica 'Vegetariano'
      String userVegetariano = selections['Vegetariano'] ?? 'No';
      String combinationVegetariano = combination['Vegetariano'] ?? 'No';

      if (normalize(userVegetariano) != normalize(combinationVegetariano)) {
        matches = false;
      }

      // Verifica 'Biologico'
      String userBiologico = selections['Biologico'] ?? 'No';
      String combinationBiologico = combination['Biologico'] ?? 'No';

      if (normalize(userBiologico) != normalize(combinationBiologico)) {
        matches = false;
      }

      // Verifica 'Fascia Prezzo'
      String userFasciaPrezzo = selections['Fascia Prezzo'] ?? '';
      String combinationFasciaPrezzo = combination['Fascia Prezzo'] ?? '';

      if (normalize(userFasciaPrezzo) != normalize(combinationFasciaPrezzo)) {
        matches = false;
      }

      return matches;
    }).toList();

    // Rimuove combinazioni duplicate
    matchingCombinations = matchingCombinations.toSet().toList();
  }

  void groupWinesByCategory() {
    // Inizializza le mappe
    winesByCategory = {
      'Vino Rosso': {'VERO': [], 'FALSO': []},
      'Vino Bianco': {'VERO': [], 'FALSO': []},
      'Spumante': {'VERO': [], 'FALSO': []},
    };

    for (var combination in matchingCombinations) {
      // Per ogni vino, ottieni il nome e il match
      combination.forEach((key, value) {
        if (key.startsWith('Rosso') ||
            key.startsWith('Bianco') ||
            key.startsWith('Spumante')) {
          if (!key.contains('Match')) {
            String wineName = value;
            String matchKey = 'Match $key';
            String matchValue = combination[matchKey] ?? 'FALSO';

            if (wineName != null &&
                wineName.isNotEmpty &&
                normalize(wineName) != 'null') {
              var wineDetail = wineDetails[wineName];
              if (wineDetail != null) {
                String tipo = wineDetail['Tipo'] ?? '';
                String category = '';
                if (tipo == 'Rosso') {
                  category = 'Vino Rosso';
                } else if (tipo == 'Bianco') {
                  category = 'Vino Bianco';
                } else if (tipo == 'Spumante') {
                  category = 'Spumante';
                }

                if (category.isNotEmpty) {
                  winesByCategory[category]![matchValue]!.add(wineName);
                }
              }
            }
          }
        }
      });
    }

    // Rimuovi duplicati
    winesByCategory.forEach((category, matches) {
      matches.forEach((matchValue, wines) {
        winesByCategory[category]![matchValue] = wines.toSet().toList();
      });
    });
  }

  Widget buildWineList(String category) {
    Map<String, List<String>> matches = winesByCategory[category] ?? {};

    List<String> veroMatches = matches['VERO'] ?? [];
    List<String> falsoMatches = matches['FALSO'] ?? [];

    List<Widget> wineWidgets = [];

    if (veroMatches.isNotEmpty) {
      // Display "VERO" matches
      wineWidgets
          .addAll(veroMatches.map((wineName) => buildWineCard(wineName)));
    }

    if (falsoMatches.isNotEmpty) {
      // Add a heading
      wineWidgets.add(
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Inoltre ti suggeriamo:',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );

      // Display "FALSO" matches
      wineWidgets
          .addAll(falsoMatches.map((wineName) => buildWineCard(wineName)));
    }

    if (wineWidgets.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Nessun vino trovato per la categoria $category.',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      return ListView(
        children: wineWidgets,
      );
    }
  }

  Widget buildWineCard(String wineName) {
    var wineDetail = wineDetails[wineName];

    if (wineDetail == null) {
      // Se non troviamo i dettagli del vino, mostriamo un messaggio generico
      return Card(
        color: Colors.black,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          title: Text(
            wineName,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: const Text(
            'Dettagli del vino non disponibili.',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      );
    }

    // Estrai le informazioni dal wineDetail
    String nomeVino = wineDetail['Nome del Vino'] ?? '';
    String prezzo = wineDetail['Prezzo'] ?? '';
    String descrizione = wineDetail['Descrizione'] ?? '';
    String linkImmagine = wineDetail['Link Immagine'] ?? '';
    String ratingMedio = wineDetail['Rating Medio'].toString();

    // Costruisci il widget secondo il design
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Immagine del vino e informazioni a sinistra
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Immagine del vino
                Image.network(
                  linkImmagine,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 150,
                      color: Colors.grey,
                      child:
                          const Icon(Icons.broken_image, color: Colors.white),
                    );
                  },
                ),
                const SizedBox(width: 16),
                // Informazioni sul vino
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nome del vino
                      Text(
                        nomeVino,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Prezzo
                      Text(
                        prezzo,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Rating
                      buildRatingWidget(ratingMedio),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Descrizione
            const Text(
              'Descrizione',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              descrizione,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRatingWidget(String ratingString) {
    // Estrai il valore numerico dal rating
    String ratingValue = ratingString.split(' ')[0]; // Prende la prima parte
    double rating = double.tryParse(ratingValue.replaceAll(',', '.')) ?? 0.0;
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    List<Widget> stars = [];

    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Color(0xFFEA2831), size: 18));
    }

    if (hasHalfStar) {
      stars
          .add(const Icon(Icons.star_half, color: Color(0xFFEA2831), size: 18));
    }

    while (stars.length < 5) {
      stars.add(
          const Icon(Icons.star_border, color: Color(0xFFEA2831), size: 18));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Valore del rating
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Stelline
        Row(
          children: stars,
        ),
      ],
    );
  }

  Widget buildCategoryNavigation() {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categoriesWine.map((category) {
          bool isSelected = selectedCategory == category;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected
                          ? const Color(0xFFEA2831)
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
                child: Text(
                  category,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Risultati'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                buildCategoryNavigation(),
                Expanded(
                  child: buildWineList(selectedCategory),
                ),
              ],
            ),
    );
  }
}

// Pagina della Carta dei Vini
class WineListPage extends StatefulWidget {
  const WineListPage({Key? key}) : super(key: key);

  @override
  _WineListPageState createState() => _WineListPageState();
}

class _WineListPageState extends State<WineListPage> {
  Map<String, dynamic> wineDetails = {};
  bool isLoading = true;

  String selectedCategory = 'Vino Rosso';

  final List<String> categoriesWine = ['Vino Rosso', 'Vino Bianco', 'Spumante'];

  Map<String, List<String>> winesByCategory = {
    'Vino Rosso': [],
    'Vino Bianco': [],
    'Spumante': [],
  };

  @override
  void initState() {
    super.initState();
    loadWineData();
  }

  Future<void> loadWineData() async {
    try {
      String wineData =
          await rootBundle.loadString('assets/data/winedetail.json');
      List<dynamic> wineList = json.decode(wineData);

      wineDetails = {for (var wine in wineList) wine['Nome del Vino']: wine};

      // Raggruppa i vini per categoria
      for (var wine in wineList) {
        String wineName = wine['Nome del Vino'];
        String tipo = wine['Tipo'] ?? '';

        if (tipo == 'Rosso') {
          winesByCategory['Vino Rosso']!.add(wineName);
        } else if (tipo == 'Bianco') {
          winesByCategory['Vino Bianco']!.add(wineName);
        } else if (tipo == 'Spumante') {
          winesByCategory['Spumante']!.add(wineName);
        }
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Errore durante il caricamento dei dati dei vini: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildWineList(String category) {
    List<String> wineNames = winesByCategory[category] ?? [];

    if (wineNames.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Nessun vino trovato per la categoria $category.',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: wineNames.length,
      itemBuilder: (context, index) {
        String wineName = wineNames[index];
        return buildWineCard(wineName);
      },
    );
  }

  Widget buildWineCard(String wineName) {
    var wineDetail = wineDetails[wineName];

    if (wineDetail == null) {
      // Se non troviamo i dettagli del vino, mostriamo un messaggio generico
      return Card(
        color: Colors.black,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          title: Text(
            wineName,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: const Text(
            'Dettagli del vino non disponibili.',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      );
    }

    // Estrai le informazioni dal wineDetail
    String nomeVino = wineDetail['Nome del Vino'] ?? '';
    String prezzo = wineDetail['Prezzo'] ?? '';
    String descrizione = wineDetail['Descrizione'] ?? '';
    String linkImmagine = wineDetail['Link Immagine'] ?? '';
    String ratingMedio = wineDetail['Rating Medio'].toString();

    // Costruisci il widget secondo il design
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Immagine del vino e informazioni a sinistra
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Immagine del vino
                Image.network(
                  linkImmagine,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 150,
                      color: Colors.grey,
                      child:
                          const Icon(Icons.broken_image, color: Colors.white),
                    );
                  },
                ),
                const SizedBox(width: 16),
                // Informazioni sul vino
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nome del vino
                      Text(
                        nomeVino,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Prezzo
                      Text(
                        prezzo,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Rating
                      buildRatingWidget(ratingMedio),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Descrizione
            const Text(
              'Descrizione',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              descrizione,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRatingWidget(String ratingString) {
    // Estrai il valore numerico dal rating
    String ratingValue = ratingString.split(' ')[0]; // Prende la prima parte
    double rating = double.tryParse(ratingValue.replaceAll(',', '.')) ?? 0.0;
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    List<Widget> stars = [];

    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Color(0xFFEA2831), size: 18));
    }

    if (hasHalfStar) {
      stars
          .add(const Icon(Icons.star_half, color: Color(0xFFEA2831), size: 18));
    }

    while (stars.length < 5) {
      stars.add(
          const Icon(Icons.star_border, color: Color(0xFFEA2831), size: 18));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Valore del rating
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Stelline
        Row(
          children: stars,
        ),
      ],
    );
  }

  Widget buildCategoryNavigation() {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categoriesWine.map((category) {
          bool isSelected = selectedCategory == category;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected
                          ? const Color(0xFFEA2831)
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
                child: Text(
                  category,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carta dei Vini'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                buildCategoryNavigation(),
                Expanded(
                  child: buildWineList(selectedCategory),
                ),
              ],
            ),
    );
  }
}
