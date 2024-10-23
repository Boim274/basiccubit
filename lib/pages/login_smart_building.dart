import 'package:basiccubit/bloc/auth/auth_bloc.dart';
import 'package:basiccubit/pages/smart-building%20copy.dart';
import 'package:basiccubit/visibility_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageSmart extends StatelessWidget {
  LoginPageSmart({super.key});
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.08,
          vertical: size.height * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Smart Building',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 30, 91),
                ),
              ),
              const Text(
                'Silahkan Login',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 131, 131, 131),
                ),
              ),
              const SizedBox(height: 40),
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildPasswordField(context),
              const SizedBox(height: 30),
              _buildLoginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailC,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return BlocConsumer<VisibilityCubit, bool>(
      listener: (context, state) {},
      builder: (context, isObscured) {
        return TextFormField(
          controller: passC,
          obscureText: isObscured,
          decoration: InputDecoration(
            labelText: 'Password',
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            suffixIcon: IconButton(
              icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                context.read<VisibilityCubit>().change();
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (emailC.text.isEmpty || passC.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill in all fields')),
          );
          return;
        }
        context.read<AuthBloc>().add(
              AuthEventLogin(
                email: emailC.text,
                password: passC.text,
              ),
            );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 6, 81, 142),
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthStateLoaded) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SmartBuilding2()),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthStateLoading) {
            return const CircularProgressIndicator(color: Colors.white);
          }
          return const Text(
            'Login',
            style: TextStyle(fontSize: 18, color: Colors.white),
          );
        },
      ),
    );
  }
}
