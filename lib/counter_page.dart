import 'package:basiccubit/bloc/bilangan_prima/bilangan_primer_cubit.dart';
import 'package:basiccubit/bloc/ganjil_genap/ganjil_genap_cubit.dart';
import 'package:basiccubit/counter_cubit.dart';
import 'package:basiccubit/visibility_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Import BilanganPrimerCubit

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<GanjilGenapCubit, int>(
            builder: (context, state) {
              return Column(
                children: [
                  Text(state == 0 ? "Genap" : "Ganjil"),
                  ElevatedButton(
                    onPressed: () {
                      context.read<GanjilGenapCubit>().hitungGanjilGenap(5);
                    },
                    child: const Text("Ganjil/Genap"),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          BlocBuilder<CounterCubit, int>(
            builder: (context, count) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().decrement();
                        },
                        child: const Text("-")),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child:
                          Text('$count', style: const TextStyle(fontSize: 20)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().increment();
                        },
                        child: const Text("+")),
                  ],
                ),
                const SizedBox(height: 10),
                BlocBuilder<BilanganPrimerCubit, bool>(
                  builder: (context, isPrime) {
                    return Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<BilanganPrimerCubit>()
                                .hitungBilanganPrimer(count);
                          },
                          child: const Text("Cek Bilangan Prima"),
                        ),
                        Text(
                          isPrime ? "Bilangan Prima" : "Bukan Bilangan Prima",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 10),
                BlocBuilder<VisibilityCubit, bool>(
                  builder: (context, isVisible) {
                    return IconButton(
                      onPressed: () {
                        context.read<VisibilityCubit>().change();
                      },
                      icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => context.read<CounterCubit>().increment(),
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () => context.read<CounterCubit>().decrement(),
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              child: const Text("X", style: TextStyle(fontSize: 20)),
              onPressed: () => context.read<CounterCubit>().multiply(),
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              child: const Text(":", style: TextStyle(fontSize: 20)),
              onPressed: () => context.read<CounterCubit>().divine(),
            ),
          ],
        ),
      ),
    );
  }
}
