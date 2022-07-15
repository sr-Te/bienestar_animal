import 'package:bienestar_animal/features/new_post/cubit/create_new_post_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';

import '../information/categories_cubit/categories_cubit.dart';

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
  Map<PostValue, String> postValues = {};

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
    return BlocBuilder<CreateNewPostCubit, CreateNewPostState>(
      builder: (context, state) {
        postValues = state.postValues;
        _updateControllers(postValues);

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
    return BlocBuilder<CreateNewPostCubit, CreateNewPostState>(
      builder: (context, state) {
        postValues = state.postValues;
        _updateControllers(postValues);

        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    postValues[PostValue.body] = value;
                    BlocProvider.of<CreateNewPostCubit>(context)
                        .setValues(postValues);
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
                postValues[PostValue.category] = value ?? '';
                BlocProvider.of<CreateNewPostCubit>(context)
                    .setValues(postValues);
              },
              selectedItem: postValues[PostValue.category],
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
          postValues[PostValue.title] = value;
          BlocProvider.of<CreateNewPostCubit>(context).setValues(postValues);
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
          postValues[PostValue.abstractText] = value;
          BlocProvider.of<CreateNewPostCubit>(context).setValues(postValues);
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

  void _updateControllers(Map<PostValue, String> postValues) {
    final currentTitle = postValues[PostValue.title] ?? '';
    final currentAbstract = postValues[PostValue.abstractText] ?? '';
    final currentBody = postValues[PostValue.body] ?? '';

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
