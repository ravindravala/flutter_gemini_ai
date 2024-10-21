import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_ai/src/features/home/cubit/home_cubit.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // Add this import

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.error != null) {
          // Show error message if there's an error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child:SingleChildScrollView( // Wrap ListView in SingleChildScrollView
                          child: Column( // Use Column to allow multiple widgets
                            children: [
                              // Display previous responses
                              ...state.responses.map((response) => 
                                Markdown(data: response.text ?? "", styleSheet: MarkdownStyleSheet(), shrinkWrap: true,physics: NeverScrollableScrollPhysics(),) // Added styleSheet
                              ).toList(),
                            ],
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter your prompt',
                      suffixIcon: state.isLoading ? Center(child: SizedBox(height: 20,width: 20,child: CircularProgressIndicator())) : IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          final prompt = _controller.text;
                          if (prompt.isNotEmpty) {
                            context.read<HomeCubit>().fetchGenerativeAIResponse(prompt);
                            _controller.clear(); // Clear the text field after submission
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
