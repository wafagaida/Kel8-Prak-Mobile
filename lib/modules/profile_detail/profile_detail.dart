import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/models/user.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? _idController;
  TextEditingController? _nameController;
  TextEditingController? _passwordController;
  TextEditingController? _emailController;
  TextEditingController? _nomorTlpController;
  bool isVisiblePassword = false;

  @override
  void initState() {
    _idController = TextEditingController(text: widget.user.id.toString());
    _nameController = TextEditingController(text: widget.user.name);
    _passwordController = TextEditingController(text: widget.user.password);
    _emailController = TextEditingController(text: widget.user.email);
    _nomorTlpController =
        TextEditingController(text: widget.user.phoneNumber.toString());
    super.initState();
  }

  @override
  void dispose() {
    _idController!.dispose();
    _nameController!.dispose();
    _passwordController!.dispose();
    _emailController!.dispose();
    _nomorTlpController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(100),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.chevron_left_rounded,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Profile Detail",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.profilePhoto!),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: _idController,
                      readOnly: true,
                      decoration: InputDecoration(
                        isDense: true,
                        label: const Text("Id"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        isDense: true,
                        label: const Text("Nama"),
                        hintText: "ex: Wafa Ghaida",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Nama wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !isVisiblePassword,
                      decoration: InputDecoration(
                        isDense: true,
                        label: const Text("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisiblePassword = !isVisiblePassword;
                            });
                          },
                          icon: Icon(
                            isVisiblePassword == false
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        isDense: true,
                        label: const Text("Email"),
                        hintText: "ex: wafa@gmail.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Email wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: _nomorTlpController,
                      decoration: InputDecoration(
                        isDense: true,
                        label: const Text("Nomor Telepon"),
                        hintText: "ex: 081***",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Nomor Telepon wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Column(
                      children: const [
                        Text("SUKSES"),
                        Text("Anda telah berhasil mengubah data diri anda")
                      ],
                    ),
                  ),
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                16,
              ),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "SIMPAN",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
