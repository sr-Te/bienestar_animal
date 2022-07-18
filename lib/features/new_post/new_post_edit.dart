// ignore_for_file: constant_identifier_names

import 'package:bienestar_animal/data/models/post.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';

import '../information/categories_cubit/categories_cubit.dart';
import 'edit_new_post_cubit/edit_new_post_cubit.dart';

const SELECT_CATEGORY = "Selecciona una categoria";
const TITLE = "Título";
const ABSTRACT = "Agrega un resumen de la nota";
const BODY = "Puedes redactar tu publicación utilizando\nMarkdown. "
    "\nSi no sabes como utilizar markdown, \npuedes ver una guía en el boton ?";

class NewPostEdit extends StatefulWidget {
  const NewPostEdit({Key? key}) : super(key: key);

  @override
  State<NewPostEdit> createState() => _NewPostEditState();
}

class _NewPostEditState extends State<NewPostEdit> {
  late int _index;
  NewPost newPost = NewPost();

  final _titleController = TextEditingController();
  final _abstractController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          NumberStepper(
            activeStep: _index,
            stepRadius: 16,
            numbers: const [1, 2],
            numberStyle: const TextStyle(color: Colors.white),
            activeStepColor: Colors.blueAccent,
            activeStepBorderPadding: 10,
            activeStepBorderColor: Colors.transparent,
            nextButtonIcon: const Icon(Icons.navigate_next),
            previousButtonIcon: const Icon(Icons.navigate_before),
            lineColor: Colors.grey,
            lineLength: 120,
            onStepReached: _onStepReached,
          ),
          _index == 0 ? _firstStep() : _secondStep(),
        ],
      ),
    );
  }

  void _onStepReached(int index) {
    setState(() {
      _index = index;
    });
  }

  Widget _firstStep() {
    return BlocBuilder<EditNewPostCubit, EditNewPostState>(
      builder: (context, state) {
        newPost = state.newPost;
        _updateControllers(newPost);

        return Expanded(
          child: ListView(
            children: [
              _selectCategory(),
              const SizedBox(height: 20),
              _titleTextField(),
              const SizedBox(height: 20),
              _abstractTextField(),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _secondStep() {
    return BlocBuilder<EditNewPostCubit, EditNewPostState>(
      builder: (context, state) {
        newPost = state.newPost;
        _updateControllers(newPost);

        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    newPost.body = value;
                    BlocProvider.of<EditNewPostCubit>(context)
                        .setValues(newPost);
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                  autofocus: true,
                  toolbarOptions: const ToolbarOptions(
                      selectAll: true, copy: true, paste: true),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: BODY,
                    hintMaxLines: null,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _selectCategory() => BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoadSuccess) {
            List<String> options = [];
            for (var c in state.categories) {
              options.add(c.name);
            }

            return DropdownSearch<String>(
              onChanged: (value) {
                newPost.category = value ?? '';
                BlocProvider.of<EditNewPostCubit>(context).setValues(newPost);
              },
              selectedItem: newPost.category,
              items: options,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: SELECT_CATEGORY,
                ),
              ),
            );
          }
          return Container();
        },
      );

  Widget _titleTextField() => TextField(
        onChanged: (value) {
          newPost.title = value;
          BlocProvider.of<EditNewPostCubit>(context).setValues(newPost);
        },
        controller: _titleController,
        toolbarOptions:
            const ToolbarOptions(selectAll: true, copy: true, paste: true),
        decoration: const InputDecoration(
          labelText: TITLE,
        ),
      );

  Widget _abstractTextField() => TextField(
        onChanged: (value) {
          newPost.postAbstract = value;
          BlocProvider.of<EditNewPostCubit>(context).setValues(newPost);
        },
        controller: _abstractController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        maxLength: 200,
        minLines: 3,
        toolbarOptions:
            const ToolbarOptions(selectAll: true, copy: true, paste: true),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: ABSTRACT,
        ),
      );

  @override
  void dispose() {
    super.dispose();
  }

  void _updateControllers(NewPost current) {
    final currentTitle = current.title ?? '';
    final currentAbstract = current.postAbstract ?? '';
    final currentBody = current.body ?? '';

    _titleController.value = TextEditingValue(
      text: currentTitle,
      selection: TextSelection(
        baseOffset: currentTitle.length,
        extentOffset: currentTitle.length,
      ),
      composing: TextRange.empty,
    );

    _abstractController.value = TextEditingValue(
      text: currentAbstract,
      selection: TextSelection(
        baseOffset: currentAbstract.length,
        extentOffset: currentAbstract.length,
      ),
      composing: TextRange.empty,
    );

    _bodyController.value = TextEditingValue(
      text: currentBody,
      selection: TextSelection(
        baseOffset: currentBody.length,
        extentOffset: currentBody.length,
      ),
      composing: TextRange.empty,
    );
  }
}
