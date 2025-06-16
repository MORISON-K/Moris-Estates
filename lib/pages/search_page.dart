import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, String>> items = [
    {
      "category": "Apartment",
      "price": "399,000",
      "description": "3 bd • 1668 sq ft",
      "location": "441 Moris Street, Kololo",
      "image": "assets/h2.jpeg",
      "seller": "Abi Holdings, (256) 760565466",
    },
    {
      "category": "Rental",
      "price": "1,200,900",
      "description": "4 bd • 2000 sq ft",
      "location": "912 Nancy Lane, Kampala",
      "image": "assets/h3.jpeg",
      "seller": "Moet Real Estates, (256) 703029989",
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredItems =
        items.where((item) {
          final query = searchQuery.toLowerCase();
          return item['category']!.toLowerCase().contains(query) ||
              item['location']!.toLowerCase().contains(query) ||
              item['seller']!.toLowerCase().contains(query);
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Properties"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search field
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by category, location, or seller...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          // Results
          Expanded(
            child: filteredItems.isEmpty
            ? const Center(
              child: Text(
                    'No results found.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
            )
    
              :ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return PropertyCard(item: filteredItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyCard extends StatefulWidget {
  final Map<String, String> item;

  const PropertyCard({super.key, required this.item});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              item['image']!,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['category']!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.teal[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'UGX ${item['price']}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  item['description']!,
                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 18, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item['location']!,
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.person, size: 18, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item['seller']!,
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
