import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';
import 'package:serendy/presentation/collection_create/bloc/create_collection_bloc.dart';

part 'widgets/_submit_button.dart';
part 'widgets/_title_text_field.dart';

class CreateCollectionScreen extends StatelessWidget {
  static const String routeName = 'create-collection';
  static const String routeLocation = '/$routeName';
  const CreateCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateCollectionBloc(collectionService: sl()),
      child: const _CreateCollectionView(),
    );
  }
}

class _CreateCollectionView extends StatelessWidget {
  const _CreateCollectionView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCollectionBloc, CreateCollectionState>(
      listener: (context, state) {
        /// 요청에 성공하면 뒤로 이동해요.
        if (state.status == CreateCollectionStatus.success) {
          context.pop();
        }

        /// 요청에 실패하면 메시지로 안내해요.
        else if (state.status == CreateCollectionStatus.failure) {
          final errorMessage = state.errorMessage ?? '서버에 문제가 생겼어요.';
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(errorMessage)));
        }
      },
      child: const _CreateCollectionTemplate(
        textField: _CreateCollectionTitleTextField(),
        submitButton: _CreateCollectionSubmitButton(),
      ),
    );
  }
}

class _CreateCollectionTemplate extends StatelessWidget {
  const _CreateCollectionTemplate({
    required this.textField,
    required this.submitButton,
  });

  final _CreateCollectionTitleTextField textField;
  final _CreateCollectionSubmitButton submitButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "어떤 테마를 만들까요?",
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            Gap.h12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kContentPadding)
                  .add(const EdgeInsets.only(bottom: Sizes.p64)),
              child: textField,
            ),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: submitButton,
        ),
      ),
    );
  }
}
