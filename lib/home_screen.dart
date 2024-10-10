import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_flutter/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewmodel(),
      child: Consumer<HomeViewmodel>(builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Search App",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: model.filteredTodos.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomTextfield(
                        hintText: "Search here..",
                        onChanged: model.search,
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(0),
                          itemCount: model.filteredTodos.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final todo = model.filteredTodos[index];
                            return CustomTile(todo: todo);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        );
      }),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      title: Text(todo.text!),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      trailing: Text(todo.dueDate.toString().substring(0, 10)),
      tileColor: Colors.grey.withOpacity(0.6),
    );
  }
}

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, this.onChanged, this.hintText = ""});
  final String hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none)),
    );
  }
}

class Todo {
  final String? text;
  final DateTime? dueDate;

  Todo({
    this.text,
    this.dueDate,
  });
}
