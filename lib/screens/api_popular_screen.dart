import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/api_popular.dart';

class ApiPopularScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ApiPopularScreen> createState() => _ApiPopularScreenState();
}

class _ApiPopularScreenState extends State<ApiPopularScreen> {
  late final peliculas = ApiPopular().getAllPopular();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular Movies')),
      body: FutureBuilder(
        future: peliculas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movies = snapshot.data!;
            if (movies.isEmpty) {
              return const Center(child: Text('No hay películas disponibles'));
            }
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final movie = movies[index];
                const placeholder = Center(child: Icon(Icons.movie, size: 48));
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: movie.posterPath.isEmpty
                              ? placeholder
                              : Image.network(
                                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, error, stackTrace) =>
                                      placeholder,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '★ ${movie.voteAverage.toStringAsFixed(1)} / 10',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            if (snapshot.hasError) {
              return const Center(
                child: Text('No se pudieron cargar las películas'),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}
