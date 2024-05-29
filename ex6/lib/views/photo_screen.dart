import 'package:ex6/models/photos.dart';
import 'package:ex6/view_models/photo_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Consumer<PhotoViewModel>(
          builder: (context, viewModel, child){
            return FutureBuilder<List<Photos>>(
                future: viewModel.photos, builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.beat(
                    color: Colors.red, size: 50
                  )
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error.toString()}')
                );
              }
              final List<Photos> photos = snapshot.data!;
              return ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading:
                        Image.network(
                          width: 100, photos[index].thumbnailUrl),
                      title: Text("${photos[index].id} ${photos[index].title}"),
                    );
                  }
                  );
            }
            );
          }
        )
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/photos/add'),
        tooltip: 'Add Photo',
        child: const Icon(Icons.add),
    )
    );
  }
}
