import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../providers/core/auth_provider.dart';
import '../routing/app_router.dart';

class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({super.key});

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    final t = Translations.of(context);
    try {
      await ref
          .read(authControllerProvider.notifier)
          .signIn(_emailController.text, _passwordController.text);
    } on AuthException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.message)));
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.drawer.snackbars.unexpectedError)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    final t = Translations.of(context);
    try {
      await ref
          .read(authControllerProvider.notifier)
          .signUp(_emailController.text, _passwordController.text);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.drawer.snackbars.confirmationSent)),
        );
      }
    } on AuthException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.message)));
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.drawer.snackbars.unexpectedError)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _buildUserInfo(User user, Translations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.drawer.cloudSync,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(t.drawer.loggedInAs, style: Theme.of(context).textTheme.bodySmall),
        Text(
          user.email ?? t.drawer.noEmail,
          style: const TextStyle(fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.logout),
            label: Text(t.drawer.logout),
            onPressed: () {
              ref.read(authControllerProvider.notifier).signOut();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
              side: BorderSide(
                color: Theme.of(context).colorScheme.error.withAlpha(64),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm(Translations t) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.drawer.cloudSync,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: t.drawer.email,
              isDense: true,
            ),
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? t.drawer.validation.emailEmpty
                        : null,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: t.drawer.password,
              isDense: true,
            ),
            obscureText: true,
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? t.drawer.validation.passwordEmpty
                        : null,
          ),
          const SizedBox(height: 16),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _signIn,
                    child: Text(t.drawer.signIn),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton(
                    onPressed: _signUp,
                    child: Text(t.drawer.signUp),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final t = Translations.of(context);
    final authState = ref.watch(authControllerProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: colorScheme.primary),
            child: Text(
              t.appName,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(t.drawer.settings),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {
              Navigator.pop(context);
              context.router.push(const SettingsRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.gamepad_outlined),
            title: Text(t.drawer.controls),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {
              Navigator.pop(context);
              context.router.push(const ControlsRoute());
            },
          ),
          const Divider(indent: 16, endIndent: 16),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(t.drawer.about),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {
              Navigator.pop(context);
              context.router.push(const AboutRoute());
            },
          ),
          const Divider(indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: authState.when(
              data: (user) {
                if (user == null) {
                  return _buildLoginForm(t);
                }
                return _buildUserInfo(user, t);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (err, stack) => Text(
                    'Error: ${err.toString()}',
                    style: TextStyle(color: colorScheme.error),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
