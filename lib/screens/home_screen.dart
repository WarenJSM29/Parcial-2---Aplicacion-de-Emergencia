// Estudiante: Waren Sanchez || Matrícula: 2023-1198

import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/event.dart';
import 'event_form_screen.dart';
import 'event_detail_screen.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> _events = [];

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    final events = await DatabaseHelper().getEvents();
    setState(() {
      _events = events;
    });
  }

  void _navigateToForm() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const EventFormScreen()),
    );
    _loadEvents(); // Refresca al volver
  }

  void _navigateToDetails(Event event) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EventDetailScreen(event: event)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eventos 911')),
      body: _events.isEmpty
          ? const Center(child: Text('No hay eventos registrados.'))
          : ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final e = _events[index];
                return ListTile(
                  leading: e.imagePath.isNotEmpty
                      ? Image.file(
                          File(e.imagePath),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.photo),
                  title: Text(e.title),
                  subtitle: Text(e.date),
                  onTap: () => _navigateToDetails(e),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
