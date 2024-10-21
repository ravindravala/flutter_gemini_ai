import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_ai/src/core/constant/app_colors.dart';
import 'package:gemini_ai/src/features/home/domain/entities/message.dart';
import 'package:gemini_ai/src/features/home/presentation/components/answer_view.dart';
import 'package:gemini_ai/src/features/home/presentation/components/question_view.dart';
import 'package:gemini_ai/src/features/home/presentation/cubit/home_cubit.dart';

OutlineInputBorder commonBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(45),
  borderSide: const BorderSide(color: Colors.transparent),
);

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.appBgColor,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...state.chatMessages.map(
                          (message) => message.type == MessageType.answer
                              ? AnswerView(text: message.text ?? "")
                              : QuestionView(text: message.text ?? ""),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: state.isLoading
                      ? const Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : TextField(
                          controller: controller,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Ask me anything!',
                            fillColor: AppColors.textfieldFillColor,
                            filled: true,
                            labelStyle: const TextStyle(color: Colors.grey),
                            errorBorder: commonBorderStyle,
                            border: commonBorderStyle,
                            focusedBorder: commonBorderStyle,
                            enabledBorder: commonBorderStyle,
                            disabledBorder: commonBorderStyle,
                            focusedErrorBorder: commonBorderStyle,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_upward,
                                    color: Colors.black),
                                style: IconButton.styleFrom(
                                    backgroundColor:
                                        AppColors.textfieldButtonBg),
                                onPressed: () {
                                  final prompt = controller.text;
                                  if (prompt.isNotEmpty) {
                                    context
                                        .read<HomeCubit>()
                                        .submitQuestion(prompt);
                                    controller.clear();
                                  }
                                },
                              ),
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
