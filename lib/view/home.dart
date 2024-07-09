import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware_assign/bloc/my_bloc_bloc.dart';
import 'package:infoware_assign/view/audioPlayer.dart';
import 'package:infoware_assign/view/details.dart';
import 'package:infoware_assign/view/surveyFrom.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Infoware Shop",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SurveyForm()));
                  },
                  child: const Text("Survey")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyAudioPlayer()));
                  },
                  child: const Text("Open Audio Player")),
            ],
          ),
        ),
      ),
      body: BlocConsumer<MyBlocBloc, MyBlocState>(
        listener: (context, state) {
          if (state is Failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.Error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is MyBlocInitial) {
            context.read<MyBlocBloc>().add(FetchData());
          }
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Success) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final item = state.data[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: ListTile(
                      leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(
                            item['image'],
                            fit: BoxFit.cover,
                          )),
                      title: Text(item['title']),
                      subtitle: Text('Price: ${item['price']} Rs'),
                      trailing: Text('Rating: ${item['rating']['rate']}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(item: item),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
