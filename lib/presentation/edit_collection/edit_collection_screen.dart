import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';
import 'package:serendy/presentation/edit_collection/bloc/edit_collection_bloc.dart';

part 'widgets/_image_picker.dart';
part 'widgets/_privacy_status_tile.dart';
part 'widgets/_remove_tile.dart';
part 'widgets/_save_button.dart';
part 'widgets/_title_text_field.dart';

@RoutePage()
class EditCollectionScreen extends StatelessWidget {
  const EditCollectionScreen({
    required this.collection,
    super.key,
  });

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditCollectionBloc(
        initialCollection: collection,
        editCollectionUseCase: sl(),
        removeCollectionUseCase: sl(),
      ),
      child: const _EditCollectionView(),
    );
  }
}

class _EditCollectionView extends StatelessWidget {
  const _EditCollectionView();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EditCollectionBloc, EditCollectionState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            /// 요청에 성공하면 뒤로 이동해요.
            if (state.status.isSuccess) {
              context.popRoute();
            }

            /// 요청에 실패하면 메시지로 안내해요.
            else if (state.status.isFailure) {
              final errorMessage = state.errorMessage ?? '서버에 문제가 생겼어요.';
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(errorMessage)));
            }
          },
        ),
        BlocListener<EditCollectionBloc, EditCollectionState>(
          listenWhen: (previous, current) =>
              previous.isDeleted != current.isDeleted &&
              current.isDeleted == true,
          listener: (context, state) {
            /// 컬렉션을 삭제하면 프로필 화면으로 이동해요.
            context.replaceRoute(const ProfileRoute());
          },
        ),
      ],
      child: const _EditCollectionTemplate(
        saveButton: _EditCollectionSaveButton(),
        imagePicker: _EditCollectionImagePicker(),
        textField: _EditCollectionTitleTextField(),
        options: [
          _EditCollectionPrivacyStatusTile(),
          _EditCollectionRemoveTile(),
        ],
      ),
    );
  }
}

class _EditCollectionTemplate extends StatelessWidget {
  const _EditCollectionTemplate({
    required this.saveButton,
    required this.imagePicker,
    required this.textField,
    required this.options,
  });

  final _EditCollectionSaveButton saveButton;
  final _EditCollectionImagePicker imagePicker;
  final _EditCollectionTitleTextField textField;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(actions: [saveButton]),
        body: SingleChildScrollView(
          child: Column(children: [
            Gap.h12,
            imagePicker,
            Gap.h12,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kContentPadding,
              ),
              child: textField,
            ),
            Gap.h24,
            ...options,
          ]),
        ),
      ),
    );
  }
}
