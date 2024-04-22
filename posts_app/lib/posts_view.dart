import 'package:flutter/material.dart';
import 'package:posts_app/core/api_servives.dart';
import 'package:posts_app/posts_model/posts_model.dart';

class PostViews extends StatefulWidget {
  const PostViews({super.key});

  @override
  State<PostViews> createState() => _PostViewsState();
}

class _PostViewsState extends State<PostViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: ApiServices.getPosts(), 
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<PostsModel> posts = snapshot.data as List<PostsModel>;
              return ListView.separated(
                itemCount: posts.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(posts[index].title!),
                      subtitle: Text(posts[index].body!),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      ),
    );
  }
}