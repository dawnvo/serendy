part of 'settings_controller.dart';

final class SettingsState extends Equatable {
  const SettingsState({
    this.reportProblemUrl = '',
    this.requestUpdateUrl = '',
    this.privacyPolicyUrl = '',
    this.termsOfServiceUrl = '',
  });

  final String requestUpdateUrl;
  final String reportProblemUrl;
  final String privacyPolicyUrl;
  final String termsOfServiceUrl;

  @override
  List<Object?> get props => [
        requestUpdateUrl,
        reportProblemUrl,
        privacyPolicyUrl,
        termsOfServiceUrl,
      ];
}
