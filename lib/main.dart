import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no_app/config/theme/app_theme.dart';
import 'package:yes_or_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_or_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // componente multiprovider-> este sirve para gestionrar todos los provvedores del manejador de estado global
    // con el change notifier, lo pasamos a la lista de providers juntop al proveedor creado

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Yes No App',
        theme: AppTheme(selectedColor: 2)
            .theme(), // con el metodo theme() -> extraemos los valores
        debugShowCheckedModeBanner: false,
        home: ChatScreen(),
      ),
    );
  }
}
