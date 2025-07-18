import 'dart:io';
import 'package:flutter/material.dart';
import '../models/event.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles del Evento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Fecha: ${event.date}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(event.description, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            if (event.imagePath.isNotEmpty && File(event.imagePath).existsSync())
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(event.imagePath),
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              )
            else
              const Center(child: Text('No hay imagen disponible.')),
          ],
        ),
      ),
    );
  }
}
