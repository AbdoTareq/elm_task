import 'package:elm_task/export.dart';
import 'package:elm_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:elm_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:elm_task/features/auth/presentation/bloc/auth_state.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key, required this.email});
  final String email;

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final otpTextController = TextEditingController();

  @override
  void dispose() {
    otpTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.t.verify),
      body: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 56),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 32,
                children: [
                  FlutterLogo(size: 300),
                  TextInput(
                    controller: otpTextController,
                    hint: context.t.email,
                    validate: (value) =>
                        value!.length > 5 ? null : context.t.required,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthError) {
                        showFailSnack(message: state.message);
                      }
                      if (state is VerifySuccess) {
                        // if (state.success) {
                        //   showSuccessSnack(message: context.t.success);
                        // } else {
                        //   showFailSnack(message: context.t.failed);
                        // }
                      }
                    },
                    builder: (context, state) {
                      return RoundedCornerButton(
                        text: context.t.verify,
                        isLoading: state is AuthLoading,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  VerifyEvent(
                                      email: widget.email,
                                      otp: otpTextController.text),
                                );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
