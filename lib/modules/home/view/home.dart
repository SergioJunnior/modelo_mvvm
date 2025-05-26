import 'package:flutter/material.dart';
import 'package:modelo_mvvm/core/design_system/components/home/home_card_widget.dart';
import 'package:modelo_mvvm/modules/home/view_model/home_view_model.dart';

class Character {
  final String title;
  final String imageUrl;
  final String description;
  final String status;
  final String species;

  Character({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.status,
    required this.species,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeViewModel viewModel = HomeViewModel();

  final List<Character> characters = [
    Character(
      title: 'Rick Sanchez',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
      description: 'A genius scientist and inventor.',
      status: 'Alive',
      species: 'Human',
    ),
    Character(
      title: 'Morty Smith',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
      description: "Rick's impressionable grandson.",
      status: 'Alive',
      species: 'Human',
    ),
    Character(
      title: 'Summer Smith',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/3.jpeg',
      description: "Morty's older sister.",
      status: 'Alive',
      species: 'Human',
    ),
    Character(
      title: 'Beth Smith',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/4.jpeg',
      description: "Rick's daughter, a horse surgeon.",
      status: 'Alive',
      species: 'Human',
    ),
    Character(
      title: 'Jerry Smith',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/5.jpeg',
      description: "Morty's father.",
      status: 'Alive',
      species: 'Human',
    ),
    Character(
      title: 'Birdperson',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/6.jpeg',
      description: "Rick's close friend.",
      status: 'Dead',
      species: 'Bird-Person',
    ),
    Character(
      title: 'Mr. Meeseeks',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/7.jpeg',
      description: 'A creature summoned to help.',
      status: 'Unknown',
      species: 'Meeseeks',
    ),
    Character(
      title: 'Squanchy',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/8.jpeg',
      description: 'A cat-like alien.',
      status: 'Alive',
      species: 'Cat-Person',
    ),
    Character(
      title: 'Tammy Guetermann',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/9.jpeg',
      description: 'A secret agent.',
      status: 'Dead',
      species: 'Human',
    ),
    Character(
      title: 'Abradolf Lincler',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/10.jpeg',
      description: 'A genetic experiment.',
      status: 'Unknown',
      species: 'Human',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0, // Espaçamento horizontal
          mainAxisSpacing: 8.0, // Espaçamento vertical
          childAspectRatio: 0.7,
        ),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return CardViewWidget(
            title: character.title,
            imageUrl: character.imageUrl,
            description: character.description,
            status: character.status,
            species: character.species,
          );
        },
      ),
    );
  }
}
