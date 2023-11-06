//packages
export 'package:flutter/material.dart' hide Theme;
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:flutter_remix_icon/remixicon.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:equatable/equatable.dart';
export 'package:go_router/go_router.dart';
export 'package:hooks_riverpod/hooks_riverpod.dart';
export 'package:riverpod_annotation/riverpod_annotation.dart';
export 'package:supabase_flutter/supabase_flutter.dart' hide Provider, User;
export 'package:responsive_builder/responsive_builder.dart' hide WidgetBuilder;

//constants
export 'constants/asset_constant.dart';
export 'constants/size_constant.dart';
export 'constants/widget_constant.dart';

//domain
export 'domain/assert.dart';
export 'domain/types.dart';
export 'domain/usecase.dart';

//exceptions
export 'exceptions/core_exception.dart';
export 'exceptions/error_logger.dart';

//persistence
export 'persistence/in_memory_store.dart';
export 'persistence/supabase.dart';
export 'persistence/table_path.dart';

//extensions
export 'extensions/context_extension.dart';
export 'extensions/enum_extension.dart';
export 'extensions/list_extension.dart';
export 'extensions/number_extension.dart';
export 'extensions/string_extension.dart';

//hooks
export 'hooks/use_pagination.dart';

//utils
export 'utils/debouncer.dart';
export 'utils/find_rank_by_count.dart';
export 'utils/add_timestamp_to_url.dart';
export 'utils/get_pagination.dart';
export 'utils/notifier_mounted.dart';
export 'utils/text_input_formatter.dart';

//others
export 'router/app_router.dart';
export 'theme/app_theme.dart';
