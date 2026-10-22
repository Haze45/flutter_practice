import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Controller for the input box
  final TextEditingController todoController =
  TextEditingController();

  // List of todos
  final List<Map<String, dynamic>> todos = [];

  // Add a new todo
  void addTodo() {
    String todo = todoController.text.trim();

    // Don't add an empty todo
    if (todo.isEmpty) {
      return;
    }

    setState(() {
      todos.add({
        'title': todo,
        'completed': false,
      });
    });

    // Clear input box
    todoController.clear();
  }

  // Mark todo as completed / incomplete
  void toggleTodo(int index) {
    setState(() {
      todos[index]['completed'] =
      !todos[index]['completed'];
    });
  }

  // Delete todo
  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // =========================
            // INPUT SECTION
            // =========================

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: todoController,

                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a todo',
                    ),

                    // Add todo when Enter is pressed
                    onSubmitted: (_) {
                      addTodo();
                    },
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: addTodo,

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(18),
                  ),

                  child: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // =========================
            // TODO LIST
            // =========================

            Expanded(
              child: todos.isEmpty
                  ? const Center(
                child: Text(
                  'No todos yet.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: todos.length,

                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),

                    child: ListTile(
                      // Complete checkbox
                      leading: Checkbox(
                        value: todos[index]['completed'],

                        onChanged: (_) {
                          toggleTodo(index);
                        },
                      ),

                      // Todo text
                      title: Text(
                        todos[index]['title'],

                        style: TextStyle(
                          fontSize: 18,

                          decoration:
                          todos[index]['completed']
                              ? TextDecoration
                              .lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                      // Delete button
                      trailing: IconButton(
                        onPressed: () {
                          deleteTodo(index);
                        },

                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}